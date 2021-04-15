package com.project.Bookstore;

public class Promotion {
    private String promoCode;
    private String title;
    private String description;
    private String startYear;
    private String startMonth;
    private String startDay;
    private String endYear;
    private String endMonth;
    private String endDay;
    private double percentage;
    private boolean isSent;


    public Promotion(String promoCode, String title, String description,
                     String startYear, String startMonth, String startDay,
                     String endYear, String endMonth, String endDay,
                     double percentage) {
        setPromoCode(promoCode);
        setTitle(title);
        setDescription(description);
        setStartYear(startYear);
        setStartMonth(startMonth);
        setStartDay(startDay);
        setEndYear(endYear);
        setEndMonth(endMonth);
        setEndDay(endDay);
        setPercentage(percentage);
        isSent = false;
    }


    public String getPromoCode() { return promoCode; }

    public void setPromoCode(String promoCode) { this.promoCode = promoCode; }

    public String getTitle() { return title; }

    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }

    public void setDescription(String description) { this.description = description; }

    public String getStartYear() { return startYear; }

    public void setStartYear(String startYear) { this.startYear = startYear; }

    public String getStartMonth() { return startMonth; }

    public void setStartMonth(String startMonth) { this.startMonth = startMonth; }

    public String getStartDay() { return startDay; }

    public void setStartDay(String startDay) { this.startDay = startDay; }

    public String getEndYear() { return endYear; }

    public void setEndYear(String endYear) { this.endYear = endYear; }

    public String getEndMonth() { return endMonth; }

    public void setEndMonth(String endMonth) { this.endMonth = endMonth; }

    public String getEndDay() { return endDay; }

    public void setEndDay(String endDay) { this.endDay = endDay; }

    public double getPercentage() { return percentage; }

    public void setPercentage(double percentage) { this.percentage = percentage; }

    public String getFormattedStartDate() { return (startYear + "-" + startMonth + "-" + startDay); }

    public String getFormattedEndDate() { return (endYear + "-" + endMonth + "-" + endDay); }

    public boolean getIsSent() { return isSent; }

    public void setIsSent(boolean isSent) { this.isSent = isSent; }


}
