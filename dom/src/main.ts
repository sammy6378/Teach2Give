

// getting the document object
const elementById: HTMLElement | null = document.getElementById("myDiv");
if(elementById){
  console.log(elementById.innerHTML);
}

// modifying the document object
const constenDiv: HTMLElement | null = document.getElementById("content");
if(constenDiv){
  constenDiv.innerHTML = "Dom Manipulation";
  constenDiv.style.backgroundColor = "gold";
}

// image manipulation
const image: HTMLImageElement | null = document.getElementById("image") as HTMLImageElement;
if(image){
  image.src = "https://i.pinimg.com/736x/bf/50/e2/bf50e22082af5810b2976308c721ee5b.jpg";
  image.alt = "W3Schools.com";
  image.width = 300;
  image.height = 300;
}