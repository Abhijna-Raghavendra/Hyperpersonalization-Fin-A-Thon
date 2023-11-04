# calculator.py

def calculate_credit_score(current_credit_score, total_credit_limit, current_outstanding, utilization_ratio,
                           new_application, loan_type, emi_payment, past_due_days, pay_emi_next_month, settlement, settling_amount, amount_due):
    impact = current_credit_score  # Initialize impact with the current credit score

    # Calculate utilization ratio
    if utilization_ratio > 0.3:
        utilization_ratio = utilization_ratio
    else:
        utilization_ratio = 0

    # Apply utilization ratio impact
    impact -= utilization_ratio * 10

    # Apply new application impact
    if new_application:
        if loan_type in ["Auto Loan", "Mortgage Loan"]:
            impact -= 10 + utilization_ratio * 10
        else:
            impact -= 5

    # Apply Leave EMI impact
    if emi_payment:
        if past_due_days == "30 Days":
            impact -= (25 + utilization_ratio * 10)
        elif past_due_days == "60 Days":
            impact -= (55 + utilization_ratio * 10)
        elif past_due_days == "90 Days":
            impact -= (85 + utilization_ratio * 10)

    # Apply Pay EMI Regularly impact
    if pay_emi_next_month:
        impact += 12

    # Apply Settlement impact
    if settlement:
        settlement_ratio = settling_amount / amount_due
        impact -= 105 * (1 - settlement_ratio)

    return int(impact)
