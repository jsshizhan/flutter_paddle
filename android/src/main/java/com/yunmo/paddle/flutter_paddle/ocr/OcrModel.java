package com.yunmo.paddle.flutter_paddle.ocr;

import com.google.gson.annotations.SerializedName;

import java.util.List;

public class OcrModel {

    @SerializedName("label")
    private String label;
    @SerializedName("confidence")
    private Float confidence;
    @SerializedName("points")
    private List<Point> points;

    public static class Point{
        @SerializedName("x")
        private int x;
        @SerializedName("y")
        private int y;

        @Override
        public String toString() {
            return "Point{" +
                    "x=" + x +
                    ", y=" + y +
                    '}';
        }

        public int getX() {
            return x;
        }

        public void setX(int x) {
            this.x = x;
        }

        public int getY() {
            return y;
        }

        public void setY(int y) {
            this.y = y;
        }
    }

    @Override
    public String toString() {
        return "OcrModel{" +
                "label='" + label + '\'' +
                ", confidence=" + confidence +
                ", points=" + points +
                '}';
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Float getConfidence() {
        return confidence;
    }

    public void setConfidence(Float confidence) {
        this.confidence = confidence;
    }

    public List<Point> getPoints() {
        return points;
    }

    public void setPoints(List<Point> points) {
        this.points = points;
    }
}
