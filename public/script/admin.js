function showContainer(containerId) {
    // Hide all containers
    document.querySelectorAll('.employeecontainer, .salarycontainer, .leavereqcontainer, .holidayscontainer')
        .forEach(container => container.classList.add('hidden'));
    
    // Show the selected container
    document.getElementById(containerId).classList.remove('hidden');
}

// Show default container (Employee section)
document.getElementById('employeecontainer').classList.remove('hidden');
