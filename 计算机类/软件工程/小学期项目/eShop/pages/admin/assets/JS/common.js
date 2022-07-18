//li的激活效果
var filename=location.pathname;
filename=filename.substr(filename.lastIndexOf('/')+1);
var n=filename.lastIndexOf('_');
if(n<0){
	filename=filename.substring(0,filename.lastIndexOf('.'));
}else{

	filename=filename.substring(0,filename.lastIndexOf('_'));
}

console.log(filename);
document.getElementById(filename).classList.add("active");
let parent=document.getElementById(filename);
let img=parent.getElementsByTagName('img');
// console.log(img);
img[0].src="assets/img/"+filename+"2.png";

//折叠菜单
var useritem=document.getElementById('useritem');
var dropmenu=document.getElementById('drop_menu');
useritem.onmousedown=function(){
     dropmenu.style.display="block";
}
useritem.onmouseleave=function(){
     dropmenu.style.display="none";
}
