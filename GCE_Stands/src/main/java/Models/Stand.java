package Models;


import java.util.List;

public class Stand {


    String id;
    private String name;

    List<Vote> listOfVotes;
    double averageVote;

    public Stand(){

    }

    public void addVote(Vote vote){
        listOfVotes.add(vote);
        averageVote =  listOfVotes.stream().mapToDouble(a -> a.getValue()).average().orElseThrow();
    }

    public Stand(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Stand{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", listOfVotes=" + listOfVotes +
                ", averageVote=" + averageVote +
                '}';
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Vote> getListOfVotes() {
        return listOfVotes;
    }

    public void setListOfVotes(List<Vote> listOfVotes) {
        this.listOfVotes = listOfVotes;
    }

    public double getAverageVote() {
        return averageVote;
    }

    public void setAverageVote(double averageVote) {
        this.averageVote = averageVote;
    }


}
