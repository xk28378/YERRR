function fetchServerContent(url) {
  var xhr = new XMLHttpRequest();
  xhr.open('GET', url);
  xhr.onload = function () {
      document.getElementById("server-output").innerHTML = xhr.response;
      if (document.getElementById("edit-submit")) {
          var ul = document.createElement("ul");
          ul.style = "list-style-type: none";
          document.getElementById("targetOutput").appendChild(ul);
          sessionStorage.setItem("contactedBefore", "Unlikely");

          ul.appendChild(createChildli("1. Content Loaded: Successful","step1"));

          var studentValues = getStudentAnswers();
          ul.appendChild(createChildli("2. Organization Value: " + studentValues.organizationValue, "step2"));
          ul.appendChild(createChildli("3. Selected Reply By Value: " + studentValues.selectedReplyByValue, "step3"));
          ul.appendChild(createChildli("4. Session Storage Value: " + studentValues.sessionStorageValue, "step4"));
          ul.appendChild(createChildli("5. Cookie Name: " + studentValues.cookieName + " - Cookie Value: " + studentValues.cookieValue, "step5"));

          var beforeValueCity = document.getElementById("edit-city").value;
          var beforeValueState = document.getElementById("edit-state").value;

          if (beforeValueCity === "" && beforeValueState === "") {
              document.getElementById("edit-submit").click();
              var afterValueCity = document.getElementById("edit-city").value;
              var afterValueState = document.getElementById("edit-state").value;

              if (afterValueCity === 'Atlanta' && afterValueState === 'Georgia') {
                  ul.appendChild(createChildli("6. City & State: " + afterValueCity + ", " + afterValueState, "step6"));
              } else{
                  ul.appendChild(createChildli("6. City & State: Incorrect values for city and state", "step6"));
              }
          } else{
              ul.appendChild(createChildli("6. City & State: Incorrect. The values were likely set before the button was clicked. Try again", "step6"));
          }
      } else {
          document.getElementById("server-output").innerHTML = "TODO: Find a way to replace this message with server content from the contact page. Hint: If you edit anything within this html div you are going down a wrong path."
      }

      function createChildli(value, id) {
          var li = document.createElement('li');
          li.innerText = value;
          li.id = id;
          return li;
      }
  };
  xhr.send();
}