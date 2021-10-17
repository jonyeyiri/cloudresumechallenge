window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
});


const functionApi = 'https://getresumecounterjojo.azurewebsites.net/api/GetCounter?code=WBtIMKSD9r1DBl8JY1XaWHkj04hFyJ2KarhuNWys6kaB1VdN0II69w==' 

//const functionApi = 'https://visitorcounter.azurewebsites.net/api/GetCounter?code=4mYCr1McGHA4t0ls8MjUCvJ8svXjJvZoaiOuwzJzTssIsHIA1jUbvw=='; 

const getVisitCount = () => {
    let count = 30;
    fetch(functionApi)
    .then(response => {
        return response.text()
    })
    .then(response => {
        console.log("Website called function API.",response);
        count = response;
        document.getElementById('viewcount').innerText = count;
    }).catch(function(error) {
        console.log(error);
      });
    return count;
}

getVisitCount();
