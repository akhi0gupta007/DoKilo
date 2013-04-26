<%@ page import="com.codebee.sales.SalesController; com.codebee.products.CustomCollection; com.codebee.products.CustomCollectionController" %>
<html>
  <head>
      <style type="text/css">

      .sidebarmenu ul{
          margin: 0;
          padding: 0;
          list-style-type: none;
          font: bold 13px Verdana;
          width: 180px; /* Main Menu Item widths */
          border-bottom: 1px solid #ccc;
      }

      .sidebarmenu ul li{
          position: relative;
      }

          /* Top level menu links style */
      .sidebarmenu ul li a{
          display: block;
          overflow: auto; /*force hasLayout in IE7 */
          color: white;
          text-decoration: none;
          padding: 6px;
          border-bottom: 1px solid #778;
          border-right: 1px solid #778;
      }

      .sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
          background-color: #012D58; /*background of tabs (default state)*/
      }

      .sidebarmenu ul li a:visited{
          color: white;
      }

      .sidebarmenu ul li a:hover{
          background-color: black;
      }

          /*Sub level menu items */
      .sidebarmenu ul li ul{
          position: absolute;
          width: 170px; /*Sub Menu Items width */
          top: 0;
          visibility: hidden;
      }

      .sidebarmenu a.subfolderstyle{
          background: url(${request.contextPath}/images/right.gif) no-repeat 97% 50%;
      }


          /* Holly Hack for IE \*/
      * html .sidebarmenu ul li { float: left; height: 1%; }
      * html .sidebarmenu ul li a { height: 1%; }
          /* End */

      </style>

      <script type="text/javascript">

          //Nested Side Bar Menu (Mar 20th, 09)
          //By Dynamic Drive: http://www.dynamicdrive.com/style/

          var menuids=["sidebarmenu1"] //Enter id(s) of each Side Bar Menu's main UL, separated by commas

          function initsidebarmenu(){
              for (var i=0; i<menuids.length; i++){
                  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul")
                  for (var t=0; t<ultags.length; t++){
                      ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle"
                      if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
                          ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px" //dynamically position first level submenus to be width of main menu item
                      else //else if this is a sub level submenu (ul)
                          ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" //position menu to the right of menu item that activated it
                      ultags[t].parentNode.onmouseover=function(){
                          this.getElementsByTagName("ul")[0].style.display="block"
                      }
                      ultags[t].parentNode.onmouseout=function(){
                          this.getElementsByTagName("ul")[0].style.display="none"
                      }
                  }
                  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
                      ultags[t].style.visibility="visible"
                      ultags[t].style.display="none"
                  }
              }
          }

          if (window.addEventListener)
              window.addEventListener("load", initsidebarmenu, false)
          else if (window.attachEvent)
              window.attachEvent("onload", initsidebarmenu)

      </script>
  </head>
   <body>
<div id="buddies">
<div class="title">
    <g:set var="status" value="false"/>
    <div class="sidebarmenu">
<ul id="sidebarmenu1">
<li><h2>Browse Catagories</h2></li>
    <br><br>
    <g:each in="${customCollectionInstanceList}" var="next">
        <li>
            <g:link action="category" id="${next.id}">${next.name}</g:link>
            <g:if test="${SalesController.hasChild(next) == 'true' && next instanceof CustomCollection}">
                ${SalesController.makeList(next,request.contextPath)}
            </g:if>
        </li>
    </g:each>
</ul> 
 </div>
<!--
 <p><strong>LATEST TWEETS</strong></p>
<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script>
new TWTR.Widget({
  version: 2,
  type: 'profile',
  rpp: 4,
  interval: 30000,
  width: 250,
  height: 300,
  theme: {
    shell: {
      background: '#333333',
      color: '#ffffff'
    },
    tweets: {
      background: 'white',
      color: 'grey',
      links: 'black'
    }
  },
  features: {
    scrollbar: false,
    loop: false,
    live: false,
    behavior: 'all'
  }
}).render().setUser('gupta007').start();

</script>
 -->
    <br><br>
<p>Facebook</p>

   
       <iframe src="http://www.facebook.com/plugins/like.php?href=http://localhost:8080/codebee/"
        scrolling="no" frameborder="0"
        style="border:none; width:450px; height:80px"></iframe>
  



</div>
</div>
   </body>
</html>