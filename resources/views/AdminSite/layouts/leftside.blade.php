<style>
    .sidebar-menu, .treeview-menu{
        list-style: none
    }
    #sidebar-menu{
        padding-left: 0;
        width: 200px;
    }
</style>
<ul id="sidebar-menu" class="sidebar-menu menu">
    <li class="header" style="padding: 10px">MAIN NAVIGATION</li>
    <li class="treeview">
        <a href="{{url('/admin')}}"><i class="fa fa-dashboard"></i><span> Dashboard</span></a>
    </li>
    <li class="treeview">
        <a href="{{url('/admin/setting/form')}}"><i class="fa fa-cogs"></i><span> Setting</span></a>
    </li>
    <li class="treeview">
        <a href="#"><i class="fa fa-users"></i><span>Group</span><i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu" style="display: none;">
            <li class="treeview">
                <a href="{{url('admin/group/create')}}"><i class="fa fa-user"></i><span> New Group</span></a>
            </li>
            <li class="treeview">
                <a href="{{url('admin/group/index')}}"><i class="fa fa-users"></i><span> All Group</span></a>
            </li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#"><i class="fa fa-users"></i><span>Student</span><i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu" style="display: none;">
            <li class="treeview">
                <a href="{{url('admin/student/create')}}"><i class="fa fa-user"></i><span> New Student</span></a>
            </li>
            <li class="treeview">
                <a href="{{url('admin/student/index')}}"><i class="fa fa-users"></i><span> All Student</span></a>
            </li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#"><i class="fa fa-question-circle"></i><span>Questions</span><i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu" style="display: none;">
            <li class="treeview">
                <a href="{{url('admin/question/create')}}"><i class="fa fa-user"></i><span> New Question</span></a>
            </li>
            <li class="treeview">
                <a href="{{url('admin/question/index')}}"><i class="fa fa-users"></i><span> All Question</span></a>
            </li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#"><i class="fa fa-question-circle"></i><span> Common Questions</span><i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu" style="display: none;">
            <li class="treeview">
                <a href="{{url('admin/common-question/create')}}"><i class="fa fa-user"></i><span> New Question</span></a>
            </li>
            <li class="treeview">
                <a href="{{url('admin/common-question/index')}}"><i class="fa fa-users"></i><span> All Question</span></a>
            </li>
        </ul>
    </li>
</ul>