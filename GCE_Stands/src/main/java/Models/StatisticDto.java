package Models;

import java.util.List;

public class StatisticDto {

    private List<Stand> topAverage;
    private List<Stand> topNumberOfVotes;

    public StatisticDto(List<Stand> topAverage,
                        List<Stand> topNumberOfVotes) {
        this.topAverage = topAverage;
        this.topNumberOfVotes = topNumberOfVotes;
    }

    public List<Stand> getTopAverage() {
        return topAverage;
    }

    public void setTopAverage(List<Stand> topAverage) {
        this.topAverage = topAverage;
    }

    public List<Stand> getTopNumberOfVotes() {
        return topNumberOfVotes;
    }

    public void setTopNumberOfVotes(List<Stand> topNumberOfVotes) {
        this.topNumberOfVotes = topNumberOfVotes;
    }
}