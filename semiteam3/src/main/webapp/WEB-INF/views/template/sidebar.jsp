<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.sidebar {
	position: sticky;
	top: 5%;
	left: 0;
	width: 200px;
	background-color: #333;
	color: #fff;
	padding: 20px;
}

/* /* Style for links in the sidebar */
.sidebar a {
	display: block;
	color: #fff;
	text-decoration: none;
	margin-bottom: 10px;
}

/* Style for active link in the sidebar */
.sidebar a.active {
	background-color: #555;
} */


</style>
</head>
<body>

    <div class="sidebar" id="sidebar">
        <a href="/inquiry/list">
            <i class="fa-solid fa-question"></i>
            <i class="fa-solid fa-list"></i>
        </a>
    </div>

    <script>
        window.onscroll = function() {
            stickySidebar()
        };

        var sidebar = document.getElementById("sidebar");
        var sticky = sidebar.offsetTop;

        function stickySidebar() {
            if (window.pageYOffset >= sticky) {
                sidebar.classList.add("sticky");
            } else {
                sidebar.classList.remove("sticky");
            }
        }
    </script>

</body>
</html>