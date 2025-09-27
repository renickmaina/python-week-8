//console.log('Hello');
//window.alert("You are intruding");
//let username;
//username = window.prompt("what's your username?");
//console.log("username"); 
/*document.getElementById("mysubmit").onclick=function(){
    username = document.getElementById("mytext").value;
    console.log(username);
    document.getElementById("MyH1").textContent = 'Hello ${username}'
}
    */
   let radius;
   let circumference;
   const PI = 3.142;
    
   document.getElementById("mysubmit").onclick = function{
    radius = document.getElementById("mytext").value
    radius = Number(radius)
    circumference = 2* radius * PI
    document.getElementById("myH3").textContent = circumference
   }
