$(function () {
    $('#sidebar-toggle-btn').on('click', function (e) {
        if ($('#mySidenav').css('width') == '200px') {

            if (typeof (Storage) !== "undefined") {
                localStorage.setItem('manage-mySidenav-width', '0');
                localStorage.setItem('manage-main-margin-left', '0');
            } else {
                window.alert('Please use a modern browser to properly view this template!');
            }

            $('#mySidenav').animate({'width': '0'}, 350);
            $('#main').animate({'margin-left': '0'}, 350);
        } else {
            if (typeof (Storage) !== "undefined") {
                localStorage.setItem('manage-mySidenav-width', '200px');
                localStorage.setItem('manage-main-margin-left', '200px');
            } else {
                window.alert('Please use a modern browser to properly view this template!');
            }
            $('#mySidenav').animate({'width': '200px'}, 350);
            $('#main').animate({'margin-left': '200px'}, 350);
        }
    });
    
    $('.treeview>a').click(function (e) {
        if($(this).attr('href') == '#'){
            e.preventDefault();
        }
        if ($(this).parent('.treeview').children('.treeview-menu').length > 0) {
                //$(this).closest('.treeview-menu').find('.treeview').slideUp();
            if ($(this).parent('.treeview').children('.treeview-menu').css('display') == 'none') {
                $(this).parent('.treeview').children('.treeview-menu').slideDown();
                $(this).find('.pull-right').removeClass('fa-angle-left');
                $(this).find('.pull-right').addClass('fa-angle-down');
            } else {
                $(this).parent('.treeview').children('.treeview-menu').slideUp();
                $(this).find('.pull-right').removeClass('fa-angle-down');
                $(this).find('.pull-right').addClass('fa-angle-left');
            }
        }
        
    });
})
