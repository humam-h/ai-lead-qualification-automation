from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "healthy"}


class Lead(BaseModel):
    name: str
    email: str
    company: str
    employees: int
    budget: float
    interest: str
    idempotency_key: str


@app.post("/score-lead")
def score_lead(lead: Lead):
    score = 0

    # Budget scoring
    if lead.budget >= 5000:
        score += 50
    elif lead.budget >= 2000:
        score += 30
    elif lead.budget >= 1000:
        score += 15

    # Company-size scoring
    if lead.employees >= 50:
        score += 30
    elif lead.employees >= 10:
        score += 20
    else:
        score += 5

    # Determine priority
    if score >= 70:
        priority = "high"
    elif score >= 40:
        priority = "medium"
    else:
        priority = "low"

    return {
        "name": lead.name,
        "email": lead.email,
        "company": lead.company,
        "employees": lead.employees,
        "budget": lead.budget,
        "interest": lead.interest,
        "idempotency_key": lead.idempotency_key,
        "score": score,
        "priority": priority
    }
