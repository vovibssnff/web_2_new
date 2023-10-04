const xCheckboxes = document.querySelectorAll('input[class="checkbox-group x-checkbox"]');

xCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        xCheckboxes.forEach(otherCheckbox => {
            if (otherCheckbox !== checkbox) {
                otherCheckbox.checked = false;
            }
        });
    });
});


