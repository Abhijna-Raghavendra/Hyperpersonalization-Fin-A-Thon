import tkinter as tk
from tkinter import ttk
from calculator import calculate_credit_score
# Create a function to handle the "Calculate Credit Score" button click


def calculate_credit_score_click():
    current_score = int(current_credit_score_entry.get())
    credit_limit = int(credit_limit_entry.get())
    outstanding = int(outstanding_entry.get())
    utilization_ratio = outstanding / credit_limit if credit_limit != 0 else 0
    new_app = new_app_check_var.get()
    loan_type = app_type_var.get() if new_app_check_var.get() else None
    emi_payment = emi_check_var.get() if emi_check_var.get() else None
    past_due_days = emi_combo_var.get() if emi_check_var.get() else None
    pay_emi_next_month = pay_emi_check_var.get()
    settlement = settlement_check_var.get()
    settling_amount = float(settling_amount_entry.get()) if settlement else 0
    amount_due = float(amount_due_entry.get()) if settlement else 0
    credit_score = calculate_credit_score(current_score, credit_limit, outstanding, utilization_ratio,
                                          new_app, loan_type, emi_payment, past_due_days, pay_emi_next_month, settlement, settling_amount, amount_due)

    # Create a function to display the selected value from the Combobox
    if (new_app == "Select" or loan_type == "Select") and new_app_check_var.get():
        set_warning("Please select a valid loan type")
        calculate_button.config(state="disabled")
        return

    if emi_check_var.get() and past_due_days == "Select":
        set_warning("Please select a valid EMI payment option")
        calculate_button.config(state="disabled")
        return

    # Display the calculated credit score
    result_label.config(text=f"Calculated Credit Score: {credit_score}")


def on_combobox_select(event):
    selected_value = emi_combo_var.get()
    print("Selected Combobox Value:", selected_value)

# Create a function to enable/disable additional inputs based on Checkbuttons


def on_emi_check():
    emi_enabled = emi_check_var.get()
    emi_combo_box.config(state="normal" if emi_enabled else "disabled")
    set_warning("")  # Clear any previous warnings
    calculate_button.config(state="normal")  # Enable the button


def on_new_app_check():
    new_app_enabled = new_app_check_var.get()
    app_type_combo.config(state="normal" if new_app_enabled else "disabled")
    set_warning("")  # Clear any previous warnings
    calculate_button.config(state="normal")  # Enable the button

# def on_pay_emi_check():
#     emi_next_month_label.config(state="normal" if pay_emi_check_var.get() else "disabled")


def on_settlement_check():
    state = "normal" if settlement_check_var.get() else "disabled"
    amount_due_label.config(state=state)
    settling_amount_label.config(state=state)
    amount_due_entry.config(state=state)
    settling_amount_entry.config(state=state)


def validate_credit_score():
    try:
        value = int(current_credit_score_entry.get())
        if 300 <= value <= 900:
            set_warning("")
            calculate_button.config(state="normal")
        else:
            set_warning("Current Credit Score must be between 300 and 900")
            calculate_button.config(state="disabled")
    except ValueError:
        set_warning("Invalid input. Enter a valid number.")
        calculate_button.config(state="disabled")


def validate_outstanding_limit():
    try:
        outstanding_value = int(outstanding_entry.get())
        limit_value = int(credit_limit_entry.get())
        if outstanding_value > limit_value:
            set_warning(
                "Current Outstanding should not exceed Total Credit Limit")
            calculate_button.config(state="disabled")
        else:
            set_warning("")
            if current_credit_score_entry.get():
                validate_credit_score()
    except ValueError:
        set_warning("Invalid input. Enter valid numbers.")
        calculate_button.config(state="disabled")


def validate_settling_amount():
    try:
        settling_value = float(settling_amount_entry.get())
        amount_due_value = float(amount_due_entry.get())
        if settling_value > amount_due_value:
            set_warning("Settling Amount should not exceed Amount Due")
            calculate_button.config(state="disabled")
        else:
            set_warning("")
            if current_credit_score_entry.get():
                validate_credit_score()
    except ValueError:
        set_warning("Invalid input. Enter valid numbers.")
        calculate_button.config(state="disabled")


def set_warning(message):
    warning_label.config(text=message)


# Create a main window
root = tk.Tk()
root.title("Credit Score Application")

# Current Credit Score Input
current_credit_score_label = tk.Label(root, text="Current Credit Score:")
current_credit_score_label.grid(row=0, column=0)

current_credit_score_entry = tk.Entry(root)
current_credit_score_entry.grid(row=0, column=1)
current_credit_score_entry.bind(
    "<FocusOut>", lambda event=None: validate_credit_score())

# Warning label for displaying validation messages
warning_label = tk.Label(root, text="", fg="red")
warning_label.grid(row=0, column=2, columnspan=2)

# Your Total Credit Limit Input
credit_limit_label = tk.Label(root, text="Your Total Credit Limit:")
credit_limit_label.grid(row=1, column=0)
credit_limit_entry = tk.Entry(root)
credit_limit_entry.grid(row=1, column=1)

# Your Current Outstanding Input
outstanding_label = tk.Label(root, text="Your Current Outstanding:")
outstanding_label.grid(row=2, column=0)

outstanding_entry = tk.Entry(root)
outstanding_entry.grid(row=2, column=1)
outstanding_entry.bind(
    "<FocusOut>", lambda event=None: validate_outstanding_limit())

# Warning label for displaying validation messages
warning_label = tk.Label(root, text="", fg="red")
warning_label.grid(row=2, column=2, columnspan=2)


# Leave EMI payment - Yes or No
emi_check_var = tk.BooleanVar()
emi_check_button = tk.Checkbutton(
    root, text="Leave EMI payment", variable=emi_check_var, command=on_emi_check)
emi_check_button.grid(row=3, column=0)
emi_combo_var = tk.StringVar()
emi_combo_var.set("Select")  # Default selection
emi_combo_box = ttk.Combobox(
    root, textvariable=emi_combo_var, state="disabled")
emi_combo_box['values'] = ("30 Days", "60 Days", "90 Days")
emi_combo_box.bind("<<ComboboxSelected>>", on_combobox_select)
emi_combo_box.grid(row=3, column=1)

# New Application - Yes or No
new_app_check_var = tk.BooleanVar()
new_app_check_button = tk.Checkbutton(
    root, text="New Application", variable=new_app_check_var, command=on_new_app_check)
new_app_check_button.grid(row=4, column=0)
app_type_var = tk.StringVar()
app_type_var.set("Select")  # Default selection
new_app_type_label = tk.Label(root, text="Select Application Type:")
new_app_type_label.grid(row=5, column=0)
app_type_combo = ttk.Combobox(
    root, textvariable=app_type_var, state="disabled")
app_type_combo['values'] = (
    "Auto Loan", "Mortgage Loan", "Credit Card", "Personal Loan", "Payday Loan")
app_type_combo.grid(row=5, column=1)

# Pay EMI Regularly for next month - Yes or No
pay_emi_check_var = tk.BooleanVar()
pay_emi_check_button = tk.Checkbutton(
    root, text="Pay EMI Regularly for next month", variable=pay_emi_check_var)
pay_emi_check_button.grid(row=6, column=0)

# Make Settlement - Yes or No
settlement_check_var = tk.BooleanVar()
settlement_check_button = tk.Checkbutton(
    root, text="Make Settlement", variable=settlement_check_var, command=on_settlement_check)
settlement_check_button.grid(row=7, column=0)

# Inputs for Amount Due and Settling Amount
amount_due_label = tk.Label(root, text="Amount Due:", state="disabled")
amount_due_label.grid(row=9, column=0)

amount_due_entry = tk.Entry(root, state="disabled")
amount_due_entry.grid(row=9, column=1)

settling_amount_label = tk.Label(
    root, text="Settling Amount:", state="disabled")
settling_amount_label.grid(row=10, column=0)

settling_amount_entry = tk.Entry(root, state="disabled")
settling_amount_entry.grid(row=10, column=1)
settling_amount_entry.bind(
    "<FocusOut>", lambda event=None: validate_settling_amount())

# Warning label for displaying validation messages
warning_label = tk.Label(root, text="", fg="red")
warning_label.grid(row=11, column=0, columnspan=2)

# Create a button to trigger the calculation
calculate_button = tk.Button(
    root, text="Calculate Credit Score", command=calculate_credit_score_click)
calculate_button.grid(row=12, columnspan=2)

# Label to display the result
result_label = tk.Label(root, text="")
result_label.grid(row=13, columnspan=2)
# Start the main event loop
root.mainloop()
