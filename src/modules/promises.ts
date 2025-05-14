// learning js promises

// aysnc await

 const getData = async () => {
    const response = await fetch("https://jsonplaceholder.typicode.com/users");

    const data = await response.json();

    console.log(data);
}


export default getData;
