const rCheckboxes = document.querySelectorAll('input[class="checkbox-group r-checkbox"]');

rCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', () => {
        rCheckboxes.forEach(otherCheckbox => {
            if (otherCheckbox !== checkbox) {
                otherCheckbox.checked = false;
            }
        });
    });
});