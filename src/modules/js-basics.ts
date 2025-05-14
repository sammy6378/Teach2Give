// javascript basics

// 1. Variables

// declaring variables

// there are 3 variables : let , var ,const

// let variable
let num = 5;
let name = "Samuel";

// scope - block scope 
if(y){
    let y = 10;
    console.log(y);
}

// var variable
if(y){
    var y = 10;
}

console.log(y) // possible since var is function scoped


// 2. Data  types

// types of data types
// 1. String;
// 2. Number;
// 3. Bigint;
// 4. Boolean;
// 5. Undefined;
// 6. Null;
// 7. Symbol;
// 8. Object;


// 3. Operators

// 1. Arithmetic Operators
// 2. Assignment Operators
// 3. Comparison Operators
// 4. String Operators
// 5. Logical Operators
// 6. Bitwise Operators
// 7. Ternary Operators
// 8. Type Operators



// 4. control flow statements
// 1. if else statement
// 2. switch statement


// getDay function example
let day;

switch (new Date().getDay()) {
    case 0:
    day = "Sunday";
    break;
    case 1:
    day = "Monday";
    break;
    case 2:
    day = "Tuesday";
    break;
    case 3:
    day = "Wednesday";
    break;
    case 4:
    day = "Thursday";
    break;
    case 5:
    day = "Friday";
    break;
    case 6:
    day = "Saturday";
    }


    // 5. javascript loops

//  for - loops through a block of code a number of times
//  for/in - loops through the properties of an object
//  for/of - loops through the values of an iterable object
//  while - loops through a block of code while a specified condition is true
//  do/while - also loops through a block of code while a specified condition is true

// for loop example

// Define the height of the triangle

function createTriangle() {
    let height = 5;

    // Using a for loop to print the triangle
    for (let row = 1; row <= height; row++) {
        let stars = ''; // Empty string to build each row

        // Add '*' to the string for each column in the current row
        for (let column = 1; column <= row; column++) {
            stars += '*';  // Append '*' to the stars string
        }

        // Print the row
        console.log(stars);
    }
}

createTriangle();


//  for in loop
//  for in statement loops through the properties of an Object
const person = {fname:"John", lname:"Doe", age:25};
 let text = "";
 for (let x in person) {
 text += person[x];
 console.log(text)
 }