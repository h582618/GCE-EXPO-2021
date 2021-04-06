package Wrappers;

import Models.Stand;

import java.util.List;

public class StandWrapper {

    private List<Stand> listOfStands;

    public StandWrapper(List<Stand> listOfStands){
        this.listOfStands = listOfStands;
    }

    public List<Stand> getListOfStands(){
        return listOfStands;
    }
}