function validate_form(form) {
    var valid = true;
    var elems = form.elements;

    if (elems.cost.value == "") {
        alert("Заполните поле цены!");
        valid = false;
    } else if (!validatecost(elems.cost.value)) {
        alert("Неверный формат ввода цены! Введите только число или число с плавающей ТОЧКОЙ.");
        valid = false;
    }
    elems.cost.value = changecost(elems.cost.value);
    if (elems.name.value == "") {
        alert("Введите описание билета!");
        valid = false;
    }
    return valid;
}

function validatecost(name) {
    var re = /^[0-9]*[.,]?[0-9]+$/;
    return re.test(name);
}

function changecost(name) {
return name.replace(',', '.')
}