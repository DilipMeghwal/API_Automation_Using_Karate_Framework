package com.api.features;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import com.opencsv.exceptions.CsvException;

public class ExportResults {

	/*public static void main(String[] args) {
		writeToCSVinTargetFolder("TEST1", "SC1", "TEST1", "TEST2");
		writeToCSVinTargetFolder("TEST2", "SC2", "TEST3", "TEST4");
		writeToCSVinTargetFolder("TEST3", "SC3", "TEST5", "TEST6");
	}*/

	public static void writeToCSVinTargetFolder(String FileName, String scenario, String request, String response) {
		try {
			File file = new File(System.getProperty("user.dir") + "\\target\\" + FileName + ".csv");
			if (file.exists()) {
				CSVReader reader = new CSVReader(
						new FileReader(System.getProperty("user.dir") + "\\target\\" + FileName + ".csv"));
				ArrayList<String[]> allData = new ArrayList<String[]>(reader.readAll());
				reader = null;
				CSVWriter writer = new CSVWriter(
						new FileWriter(System.getProperty("user.dir") + "\\target\\" + FileName + ".csv"));
				List<String> lst = new ArrayList<String>();
				lst.add(scenario);
				lst.add(request);
				lst.add(response);
				String[] test = new String[lst.size()];
				test = lst.toArray(test);
				allData.add(test);
				writer.writeAll(allData);
				writer.flush();
			} else {
				System.out.println(System.getProperty("user.dir") + "\\target\\" + FileName + ".csv");
				file.createNewFile();

				CSVWriter writer = new CSVWriter(
						new FileWriter(System.getProperty("user.dir") + "\\target\\" + FileName + ".csv"));
				ArrayList<String> lst = new ArrayList<String>();
				lst.add("Scenario");
				lst.add("Request");
				lst.add("Response");
				String[] test = new String[lst.size()];
				test = lst.toArray(test);
				writer.writeNext(test, false);
				
				ArrayList<String> lst2 = new ArrayList<String>();
				lst2.add(scenario);
				lst2.add(request);
				lst2.add(response);
				String[] test2 = new String[lst2.size()];
				test2 = lst2.toArray(test2);
				writer.writeNext(test2, false);
				writer.flush();
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (CsvException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String dataSaveStatus() {
		return "Data Saved Successfuly!!!!!";
	}

	public static void writeToTestDataCSV(String request, String response) {
		try {
			CSVReader reader = new CSVReader(new FileReader(
					"..//API_Automation_Using_Karate_Framework//src//test//java//api//UserData//com//testData.csv"));
			List<String[]> allData = new ArrayList<String[]>(reader.readAll());
			reader = null;
			CSVWriter writer = new CSVWriter(new FileWriter(
					"..//API_Automation_Using_Karate_Framework//src//test//java//api//UserData//com//testData.csv"));
			for (String[] str : allData) {
				ArrayList<String> lst = new ArrayList<String>(Arrays.asList(str));
				if (str[0].contains("102")) {
					lst.add(request);
					lst.add(response);
					String[] test = new String[lst.size()];
					test = lst.toArray(test);
					writer.writeNext(test, false);
				} else if (str[0].contains("ID")) {
					lst.add("Request");
					lst.add("Response");
					String[] test = new String[lst.size()];
					test = lst.toArray(test);
					writer.writeNext(test, false);
					;
				} else {
					writer.writeNext(str, false);
				}
			}
			writer.flush();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (CsvException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
