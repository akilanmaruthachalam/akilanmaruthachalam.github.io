let a = document.getElementById('s');
      let arr;
      let i=0;
      let x ;
const database = firebase.database();
 
  // initiating variables
 
  





    document.getElementById('inputfile').addEventListener('change', function ()
    {
      
      alert(String(document.getElementById('first').value));
            var fr=new FileReader();
            fr.onload=function(){ 
              document.getElementById('output'); 
                  x=fr.result; 
                  a.textContent=x;
                  arr=x;
                      
                } 
      
                fr.readAsText(this.files[0]); 
            
            }) 
            
function qass() {

  var ename = document.getElementById("examname").value;
  var eid = document.getElementById("examid").value;
  var doe = document.getElementById("doe").value;
  var dept = document.getElementById("department").value;
  var year = document.getElementById("yr").value;
  var total = document.getElementById("tot").value;
  var first = document.getElementById("first").value;
  var last = document.getElementById("last").value;
  for (i = first; i < last; i++) {
    database.ref('user/'+year+dept+i).set({
      
      examname: ename,
      
      exam_id: eid,
      exam_date: doe,
      dept: dept,
      year: year,
      
      
      seatno:arr.split('-')[i]
    })
  }
 
} 





 

function showcon() {
  var xq = document.getElementById("st");
  if (xq.style.display === "none") {
    xq.style.display = "block";
  } else {
    xq.style.display = "none";
  }
}
  

