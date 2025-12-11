% CSE1101 Assignment 1
% Name: Tarico Henry
% USI: 1057554

% This application is an expert system
% Main aim of applicationn is to determine if an animal is a veritbrate or invertibrate
% This application can also determine what kind of animal is
% Note that the list of animals able to be determined is currently limited to cow, mosquito, lion, bee and circkets

% Data for the knowledge base of this program is provided by Mr. John
% Mr. John is an expert in Biology and has many years of experiencee


% git repo: https://github.com/TaricoHenry/CSE2102-Assignment-1
% linkedin profile: https://gy.linkedin.com/in/tarico-henry

% Assingment definition file is located in the README file of the repo.



% Declaring a predicate to store or rememebr a user answers to avoid backtracking
:- dynamic known/3.   


% setting up a variable to store the animal we are looking for
animal_we_need(X) :- animal(X).


% Main execution starts here.
solve :-

    % First clear the old answers. Otherwise, we will cause the application to pull old data from memory
    retractall(known(_,_,_)),   

    % Instantiate our animal variable
    animal_we_need(X), 

    % Write the output to CLI for the user  
    write(''), nl, nl, 
    write('##########################'), nl,                   
    write('The animal is: '), 
    write(X), nl,
    write('##########################'), nl, nl.

% Set up a fall back or failsafe, essentially a default response     
solve :-
    write(''), nl, nl, 
    write('##########################'), nl,
    write('This is an unknown animal.'), nl,
    write('##########################'), nl, nl.


% Set up the Knoweledge base for the applciation

% Set up the conditions necessary for an animal to be declared as a vertebrate. 
% All conditions msut be true for condition to be true. Essentially an AND condition 
type(vertebrate) :-

    % checking sequentially if an animal has the characteristics to be declared a vertebrate
    vertebral_column(present),
    skeleton(internal),
    nerve_cord(dorsal_and_hollow),
    heart_location(right_side),
    haemoglobin(red_blood_cells).

% Set up the conditions necessary for an animal to be declared as am invertebrate
type(invertebrate) :-

    % checking sequentially to determine if an animal is an invertibrate

    % We do not need to check if the vertebral_column is present 
    % We can safely assume it is absent as user ansered no when we asked them if it present in the above check if animal is veritbrate
    skeleton(external),
    nerve_cord(ventral_and_solid),
    heart_location(dorsal),
    haemoglobin(dissolved_in_plasma).


% Set up knowledge base to determine a specific animal

% Conditions necessary for an animal to be declared as cow
animal(cow) :-
    type(vertebrate),
    color(black_and_white),
    sound(moo).

% Conditions necessary for an animal to be declared as lion
animal(lion) :-
    type(vertebrate),
    color(brown),
    sound(rawr).

% Conditions necessary for an animal to be declared as mosquito
animal(mosquito) :-
    type(invertebrate),
    color(black),
    sound(zzz).

% Conditions necessary for an animal to be declared as bee
animal(bee) :-
    type(invertebrate),
    color(yellow),
    sound(buzz).

% Conditions necessary for an animal to be declared as cricket
animal(cricket) :-
    type(invertebrate),
    color(green),
    sound(chirp).



% Set up the questions to be displayed to the user in CLI
% Essentially asking the whether an animal has a certain characteristic and storing it
vertebral_column(X) :- ask(vertebral_column, X).
skeleton(X) :- ask(skeleton, X).
nerve_cord(X) :- ask(nerve_cord, X).
heart_location(X) :- ask(heart_location, X).
haemoglobin(X) :- ask(haemoglobin, X).
color(X) :- ask(color, X).
sound(X) :- ask(sound, X).




% Create a helper prettify function to make the questions easier to read
% The aim is to remove underscores
% Essentially we treat underscores as a delimiter and then just concat the string using spaces
prettify(Input, Output) :-
    atomic_list_concat(Parts, '_', Input),
    atomic_list_concat(Parts, ' ', Output).



% Set up predicate (the interactive question segment)
% Taken from assignment instructions

% If user has already answered yes, then this step succeeds immediately and is skipped
ask(A, V) :-
    known(yes, A, V), !.

% If user has answered no, then this steps fails
ask(A, V) :-
    known(no, A, V), !, fail.

% Set up up ask clause to create more human like natrual flowing questions
ask(A, V) :-

    % call the prettify function to Convert A and V into a nice format
    prettify(A, Aprettified),
    prettify(V, Vprettified),

    % Print a question that is easy to read
    format('Is the ~w ~w? ', [Aprettified, Vprettified]),

    % Read the response from CLI
    read(Response),

    % Store the response CLI
    asserta(known(Response, A, V)),

    % Only succeed if the user said yes
    Response == yes.



% set up user interface for application
% we are using start as the key word as users are typically accustomed to typing start when starting an applciation
start :-
    nl, 
    write('##################################################'), nl,
    write('     ANIMAL IDENTIFICATION EXPERT SYSTEM          '), nl,
    write('     CSE1101 PROJECT                              '), nl,
    write('     BUILT BY: TARICO HENRY  USI: 1057554         '), nl,
    write('##################################################'), nl,
    write('Please answer each question with yes. or no.'), nl,
    write('Type solve. to begin.'), nl, nl.
