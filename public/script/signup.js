document.addEventListener("DOMContentLoaded", function() {
    const departmentSelect = document.getElementById("department");
    const positionSelect = document.getElementById("position");

    // Define positions for each department
    const positions = {
        "Sales Department": [
            "Sales Manager",
            "Sales Executive",
            "Showroom Sales Consultant",
            "Fleet Sales Officer",
            "Sales Coordinator",
            "Customer Service Representative"
        ],
        "Service Department": [
            "Service Manager",
            "Service Advisor",
            "Automotive Technician",
            "Warranty Clerk",
            "Service Coordinator",
            "Quality Control Inspector"
        ],
        "Parts Department": [
            "Parts Manager",
            "Parts Specialist",
            "Inventory Control Specialist",
            "Warehouse Assistant",
            "Parts Sales Representative",
            "Parts Clerk"
        ],
        "Finance and Accounting Department": [
            "Finance Manager",
            "Accountant",
            "Billing Specialist",
            "Accounts Receivable Clerk",
            "Payroll Specialist",
            "Financial Analyst"
        ],
        "Marketing Department": [
            "Marketing Manager",
            "Digital Marketing Specialist",
            "Marketing Coordinator",
            "Event Planner",
            "Social Media Manager",
            "Public Relations Officer"
        ],
        "Human Resources Department": [
            "HR Manager",
            "Recruitment Specialist",
            "Payroll Officer",
            "Employee Relations Officer",
            "Training and Development Coordinator",
            "Benefits Administrator"
        ],
        "Customer Relations Department": [
            "Customer Relations Manager",
            "Customer Service Representative",
            "Complaint Resolution Specialist",
            "Call Center Agent",
            "Customer Support Specialist",
            "Customer Success Manager"
        ],
        "IT Department": [
            "IT Manager",
            "Network Administrator",
            "Systems Analyst",
            "Help Desk Support",
            "Software Developer",
            "Database Administrator"
        ],
        "Security Department": [
            "Security Manager",
            "Security Guard",
            "CCTV Operator",
            "Safety Officer",
            "Loss Prevention Officer"
        ],
        "Logistics and Transport Department": [
            "Logistics Manager",
            "Transport Coordinator",
            "Fleet Manager",
            "Delivery Driver",
            "Dispatch Supervisor",
            "Warehouse Supervisor"
        ],
        "Cleaning Department": [
            "Cleaning Supervisor",
            "Janitor/Custodian",
            "Housekeeping Staff",
            "Sanitation Worker",
            "Window Cleaner",
            "Waste Management Specialist"
        ]
    };

    // Event listener for department selection
    departmentSelect.addEventListener("change", function() {
        const selectedDepartment = this.value;
        // Clear previous position options
        positionSelect.innerHTML = '<option value="" disabled selected>Select Position</option>';

        // Populate positions based on selected department
        if (positions[selectedDepartment]) {
            positions[selectedDepartment].forEach(position => {
                const option = document.createElement("option");
                option.value = position;
                option.textContent = position;
                positionSelect.appendChild(option);
            });
        }
    });
});
