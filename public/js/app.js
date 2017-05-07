$(function () {
    //general setting
    $('.select2-seach').select2();
    $('.group-select2-seach').select2({
        placeholder: "Select Group"
    });
    $('.days-seach').select2({
        placeholder: "Select Day"
    });

    $(document).on('click', '#bs-example-navbar-collapse-1 .dropdown-menu', function (e) {
        e.stopPropagation();
    });
    
});