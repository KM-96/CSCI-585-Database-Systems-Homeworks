import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

class GenerateSpirograph {
    public static void main(String[] args) {
        FileWriter fileWriter = null;
        try {
            File file = new File("spiro.kml");
            fileWriter = new FileWriter(file);
            StringBuilder kmlDocument = new StringBuilder();
            //KML Definition contents
            kmlDocument.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                    "<kml xmlns=\"http://earth.google.com/kml/2.0\">\n" +
                    "<Document>\n");
            kmlDocument.append("\n" +
                    "<Placemark>\n" +
                    "<LineString>\n" +
                    "<coordinates>");

            double bovardXCoordinate = -118.285556;
            double bovardYCoordinate = 34.021047;
            double R = 5, r = 1, a = 4;
            double x0 = R + r - a, y0 = 0;

            int nRev = 10;
            for (double t = 0.0; t < (Math.PI * nRev); t += 0.01) {
                double x = ((R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t))/1000;
                double y = ((R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t))/1000;
                kmlDocument.append("\n" + (bovardXCoordinate + x) + "," + (bovardYCoordinate + y) + "," + "0");
            }

            kmlDocument.append("\n</coordinates>\n" +
                    " </LineString>\n" +
                    "</Placemark>\n");
            //KML Definiton contents closing tags
            kmlDocument.append("</Document>\n" +
                    "</kml>");

            fileWriter.write(kmlDocument.toString());
            System.out.println("Document created Successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                fileWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}