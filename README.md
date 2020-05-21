## Flutter Examples
A repository of examples for Flutter (not to be released as full apps). These range from basic counters to more fleshed out systems using BloC and network calls.

- [**Common**](common) A project of shared dependencies, files and properties to be used in all examples. This is just to make it easy to use dependencies without having to add it to every possible app
    - **Enum** A class that acts like a Java enum
    - **BloCProvider** A class to provide and access BloC's
    - **RxObservableCollection** Encapsulates an RxDart BehaviorSubject allowing for interactions and observations on Iterables
    - **RxObservableList** A delegating list mixed with RxObservableCollection
    - **RxObservableSet** A delegating set mixed with RxObservableCollection

- [**Basic Counter**](basic_counter) A counter app using the standard state model, nothing special, just the default counter really

- [**BloC Counter**](bloc_counter) A counter app using BloC state management

- [**Random Words**](random_words) A random words generator with infinite tiles and a saving mechanism

- [**BloC Login**](bloc_login) A very basic login system, uses RxDart and streams for verification piping

- [**Date Time**](date_time) An app to display the date and time of the current locale

- [**Users Loading**](users_loading) An app to display a list of users using network calls and JSON deserialization. json_serializable used for processing

- [**Posts Loading**](posts_loading) An app to display a list of posts from a REST API. jaguar packages used for JSON processing and network calls