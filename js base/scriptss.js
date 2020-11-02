
function showcon() {
  var xq = document.getElementById("fdet");
  if (xq.style.display === "block") {
    xq.style.display = "none";
  } else {
    xq.style.display = "block";
  }
}
function sass() {
  showcon();
 
  var dept = document.getElementById("department").value;
  var year = document.getElementById("yr").value;
  var rollno = document.getElementById("rn").value;
    
  
  var exam = document.getElementById('ex');
  var examid = document.getElementById('exid');
  var department = document.getElementById('dep');
  var yr = document.getElementById('year');
  var date = document.getElementById('dod');
  var seano = document.getElementById('place');
  
  
 
  firebase.database().ref('user/' + year + dept + rollno).on('value', function (snapshot) {
    
  
    exam.value  = snapshot.val().examname;
    examid.value= snapshot.val().exam_id;
    department.value = snapshot.val().dept;
    yr.value = snapshot.val().year;
    date.value = snapshot.val().exam_date;
    seano.value = snapshot.val().seatno;
    
  });
   
          
    
} 
          
          
   

