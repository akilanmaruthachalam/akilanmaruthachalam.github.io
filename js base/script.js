let a = document.getElementById('s');
      let arr;
      let i=0;
      let x ;
const database = firebase.database();
const id = document.getElementById('uid');
    document.getElementById('inputfile').addEventListener('change', function ()
              { 
            
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
                
    database.ref('/user/' ).set({
        timtable: arr,
        
    })
   
} 

function sass() {
    database.ref('/user/').on('value', function (snapshot) {
        document.getElementById('s').value = snapshot.val().timtable.split('.');
    });
}