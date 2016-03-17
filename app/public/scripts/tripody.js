document.addEventListener("DOMContentLoaded", function(event) {

  // elements for adding pois to personal list
  var togglePoiList = document.getElementsByClassName('toggle-poi');
  for (i = 0; i < togglePoiList.length; ++i) {
    togglePoiList[i].addEventListener("click", handlePOI);
  }

  // element for returning to search results
  var backLink = document.getElementById('back-link');
  if(backLink != null){
      backLink.addEventListener("click", handleBackButton);
  }
  // element for executing search
  var searchLink = document.getElementById('search-link');
  if(searchLink){
      searchLink.addEventListener("click", search);
  }

  // appending personal token to link to personal list
  handleToken();
});

/*
 * Toggles the state of the button and adds http method
 */
function togglePOI(button) {
  var windowLocation = window.location.pathname;

  // search view
  if(windowLocation.indexOf("search") > -1){
    // handle switch from + to -
    if(button.textContent === '+'){
      button.className = 'toggle-poi remove btn btn-default';
      button.method = 'POST';
      button.textContent = '-';
      console.log("Switching to -");
    } else {
      button.className = 'toggle-poi add btn btn-default';
      button.method = 'DELETE';
      button.textContent = '+';
      console.log("Switching to +");
    }
  }

  // list view
  if(windowLocation.indexOf("list") > -1){
    if(button.textContent === '-'){
      button.method = 'DELETE';
    }
  }
}

/*
* Handle link adjustment for forwarding to personal list
*/
function handleToken(){
  var token = localStorage.getItem('user-token');
  var link = document.getElementById('my-list-ref');
  if(token!=null && link!=null){
	    link.href += token;
  }
}


/*
* Handling of updating personal list of pois
*/
function handlePOI(){
   // adjusting button state
   togglePOI(this);
   var poiId = this.value;
   // fetching token
   var token = localStorage.getItem('user-token');
   xhr = new XMLHttpRequest();
   // if there is no token, request one from server
   if(token===null){
     this.method = "GET";
     url = "/token/";
     xhr.onreadystatechange = function() {
     if (xhr.readyState == 4 && xhr.status == 200) {
         // SETTING TOKEN
         localStorage.setItem("user-token", xhr.responseText);
         handleToken();
         //send request
         url = "/list/"+xhr.responseText+"/"+poiId;
         xhr = new XMLHttpRequest();
         xhr.open("POST", url, true);
         xhr.send();
     }
   };
   // sending ajax request to update list
   } else {
      url = "/list/" + token + "/" + poiId
   }
   //send request
   xhr.open(this.method, url, true);
   xhr.send();

   // handle reload if on list view
   var windowLocation = window.location.pathname;
   if(windowLocation.indexOf("list") > -1){
     location.reload();
   }
 }

/*
* Handle switching back to search result page
*/
function handleBackButton(){
   // fetching information
   var searchTerm = localStorage.getItem('search-term');
   var token = localStorage.getItem('user-token');
   var location = "/search/" + searchTerm;
   if(token!=null){
     location += '/' + token;
   }
   window.location = location;
}

/*
* Handles mapping of search route for rest call
*/
function search(){
  var searchTerm = document.getElementById("search-input").value;
  var route = "/search/" + searchTerm;
  localStorage.setItem("search-term", searchTerm);
  window.location = route;
}
