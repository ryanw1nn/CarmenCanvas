$(document).on('submit', 'form', function(e) {
    e.preventDefault(); // Prevent default form submission

    // Get the checkbox state
    var isAdmin = $('#user_admin').is(':checked');

    // Store the checkbox state in local storage
    localStorage.setItem('isAdminChecked', isAdmin);

    // Set the value of user[admin] based on the checkbox state
    $(this).find('input[name="user[admin]"]').val(isAdmin ? '1' : '0');

    // Serialize form data
    var formData = $(this).serialize();

    console.log('Submitting AJAX request...');
    $.ajax({
        url: $(this).attr('action'), // Get the form action
        method: $(this).attr('method'), // Get the form method
        data: formData, // Send all form data
        dataType: 'script', // Specify the dataType as script
        success: function(response) {
            console.log('Response:', response);
            $('#user_admin').prop('checked', response.admin);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});

// Check if there's a stored value for the checkbox state in local storage
var isAdminChecked = localStorage.getItem('isAdminChecked');

// Set the checkbox state based on the stored value (or default to unchecked)
$('#user_admin').prop('checked', isAdminChecked === 'true');

// Event handler for when the checkbox is clicked
$('#user_admin').on('change', function() {
    // Store the updated checkbox state in local storage
    localStorage.setItem('isAdminChecked', $(this).is(':checked'));
});

// AJAX success event listener
$(document).on('ajax:success', '#user-form', function(event) {
    // Update the checkbox based on the response
    $('#user_admin').prop('checked', event.detail[0].admin);
});
