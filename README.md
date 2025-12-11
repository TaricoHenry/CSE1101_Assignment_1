# Animal Identification Expert System

### CSE1101 – Assignment 1
*All assignment details are located in the `docs/` folder.*


The task for this assignment was to create a simple **expert system** built using **Prolog**

Lectures for my year: Dr. Roland Daynauth (roland.daynauth@uog.edu.gy) and Ms. Alicia Grant (Layne) (alicia.layne@uog.edu.gy)

## Application Summary
The system asks the user a series of yes/no questions and uses those answers to determine:
* whether the animal is a **vertebrate** or **invertebrate**, and
* which specific animal it is (cow, lion, mosquito, bee, or cricket).

The knowledge base and stuff like the characteristics of each animal was provided in the assignment files.
Check the docs folder for more details



## Project Structure
```
/docs --> Details that describe the assignment
/CSE1101_Assignment_Tarico_Henry.pl  --> code that was submitted
/README.md  --> This file  
```

---

## How to Run the Application (SWI-Prolog)

Essentially crash course to install prolog and get up to speed. 
Note, all code was written on MAC so your mileage may vary on other OS.


### 1. Install SWI-Prolog

Download from: [https://www.swi-prolog.org/](https://www.swi-prolog.org/)

### 2. Open a terminal and navigate to the project folder

```bash
cd path/to/project
```

### 3. Start SWI-Prolog and load the program

```bash
swipl 
```

(or whatever the filename is)

### 4. Start the expert system interface

Once Prolog loads, type:

```prolog
start.
```

This prints the welcome banner and instructions.

### 5. Begin solving

```prolog
solve.
```

The system will begin asking yes/no questions such as:

```
Is the vertebral column present?
Is the color black and white?
```

Answer each with:

```
yes.
```

or

```
no.
```

When finished, Prolog will output the identified animal.

---


See screenshot below of running the program:
![Running the program in terminal](/Images/terminal_screenshot.png)