
var letters = /^[A-Za-z0-9]+$/;
var ec      = /^[A-Za-z0-9@.]+$/;
var pc      = /^[!@#$%^*]+$/;
var mc      = /^[0-9]+$/;

let  un  = document.getElementById('uname');

let  ps  = document.getElementById('pswd');
let  cps = document.getElementById('cpswd');
let  mn  = document.getElementById('number');
let bd   = document.getElementById('dob');

let  pun = document.getElementById('unresult');

let  pp  = document.getElementById('presult');
let  pcp = document.getElementById('cpresult');
let  pmn = document.getElementById('mnresult');
let  pd  = document.getElementById('dresult');
// let xx  = document.getElementById('');

let vnum = 0;


un.addEventListener('change', function () {
    

    if (un.value == '') {
        pun.innerHTML = "user-name should not be empty !!!";
    }
    
    else if (!un.value.match(letters)) {
        pun.innerHTML = "invalid use of characters !!";
    }
    else {
        pun.style.display = "none";
        vnum = vnum + 1;
    }
    
})




ps.addEventListener('change', function () {
    if (ps.value.length < 8) {
        pp.innerHTML = 'password must be of atleast 8 characters';
    }
    
    else {
        pp.style.display = "none";
        vnum = vnum + 1;
    }
})


cps.addEventListener('change', function () {
    if (ps.value != cps.value) {
        pcp.innerHTML = 'password un-match !!!';
    }  
    else {
        cps.addEventListener('change', function () {
            pcp.style.display = "none";
            vnum = vnum + 1;
        })
    }
})

mn.addEventListener('change', function () {
    if (!mn.value.match(mc)) {
        pmn.innerHTML = 'mobile number must be a number';
    }
    else if (mn.value.length > 10) {
        pmn.innerHTML = 'not a valid one';
    }
    else {
        pmn.style.display = "none";
        vnum = vnum + 1;

    }

})
function chck() {
    if( un.value != '' &&
        
        ps.value != '' &&
       cps.value != '' &&
        mn.value != '' &&
        bd.value != '' ) {
        alert('Welcome' + " " + un.value);

        }

    else {
        alert('fill all the fields');
    }




}
