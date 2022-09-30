package com.example.sqliteapptest;

import androidx.appcompat.app.AppCompatActivity;

import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainActivity extends AppCompatActivity {

    private SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String line = "KEY `BasketId` (`BasketId`),";

        Log.e("", "start with:" + line.startsWith("^[^)]((?![\\w]+[\\s]KEY).)*$"));


//        String[] s = line.split("^\\s*CREATE TABLE.*[`\"](.*)[`\"]");

//        for (String str : s)
//            Log.e("", ":::" + str);


        Thread t1 = new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    initDb2();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        });
        t1.start();
    }

    private void initDb2() throws IOException {
        InputStream insertsStream = getResources().openRawResource(R.raw.baza);
        BufferedReader insertReader = new BufferedReader(new InputStreamReader(insertsStream));

        SQLliteConverter sqlConv = new SQLliteConverter();

        DbHelper dbHelper = new DbHelper(this);
        this.db = dbHelper.getWritableDatabase();

        // Iterate through lines (assuming each insert has its own line and theres no other stuff)
        while (insertReader.ready()) {
            String line = insertReader.readLine();

            if (sqlConv.convertToSql(line))
                db.execSQL(sqlConv.getRes().toString());
        }

        Scanner scan = new Scanner(sqlConv.getEndCmd().toString());
        while (scan.hasNextLine() ){
            String endCmd = scan.nextLine();
            Log.e("", "END_CMD: " +endCmd);
            db.execSQL(endCmd);
        }
    }

    private void initDb() throws IOException {
        StringBuilder sb = new StringBuilder();
        boolean isWaitToEnd = false;


        int result = 0;

        DbHelper dbHelper = new DbHelper(this);
        this.db = dbHelper.getWritableDatabase();


        InputStream insertsStream = getResources().openRawResource(R.raw.modif_46_sqlite);

        BufferedReader insertReader = new BufferedReader(new InputStreamReader(insertsStream));

        // Iterate through lines (assuming each insert has its own line and theres no other stuff)
        while (insertReader.ready()) {
            String insertStmt = insertReader.readLine();

            if (insertStmt != null
                    && insertStmt.length() > 1
                    && !insertStmt.startsWith("--")
                    && !insertStmt.startsWith("/*")
                    && !insertStmt.startsWith("LOCK")
                    && !insertStmt.startsWith("UNLOCK")
                    && !insertStmt.startsWith("PRAGMA")) {

                if (insertStmt.endsWith(";")) {
                    String cmd = insertStmt;

                    if (isWaitToEnd) {
                        isWaitToEnd = false;
                        cmd = sb + insertStmt;
                    }

                    if (cmd.contains("current_timestamp()"))
                        cmd = cmd.replace("current_timestamp()", "CURRENT_TIMESTAMP");

                    Log.e("", "RUN_CMD: " + cmd);
                    db.execSQL(cmd);


                } else {
                    if (!isWaitToEnd) {
                        isWaitToEnd = true;
                        sb.setLength(0);
                    }
                    sb.append(insertStmt);
                    Log.d("", "sb: " + sb);
                }

            } else
                Log.d("", "...........................    skip: " + insertStmt);
            result++;
        }

        insertReader.close();
        Log.e("", "res: " + result);

    }
}