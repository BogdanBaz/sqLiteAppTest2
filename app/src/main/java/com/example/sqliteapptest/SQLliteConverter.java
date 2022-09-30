package com.example.sqliteapptest;

import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SQLliteConverter {

    private static final String[] skip = new String[]{"CREATE DATABASE", "USE", "/*", "--", "LOCK", "UNLOCK"};
    StringBuilder res = new StringBuilder();

    StringBuilder endCmd = new StringBuilder();

    boolean isWait = false;
    private String currentTable;


    public static StringBuilder convertSql(InputStream insertsStream) throws IOException {

        BufferedReader insertReader = new BufferedReader(new InputStreamReader(insertsStream));
        StringBuilder sqlite = new StringBuilder();

        boolean isToSkip = false;
        String currentTable = "";
        String[] keys = new String[]{};


        while (insertReader.ready()) {
            String line = insertReader.readLine();
//    lineLoop:

//        for (var i = 0; i < lines.length; i++) {
            if (line == null || line.length() == 0)
                continue;

            line = line.trim();

            // Skip lines that match regexes in the skip[] array above
            for (String sk : skip) {
                if (line.contains(sk)) {
                    isToSkip = true;
                    break;
                }
            }
            if (isToSkip) {
                Log.e("", "skip:" + line);
                isToSkip = false;
                continue;
            }

            // TODO Include all `INSERT` lines. Replace \' by '' -> SKIPED

            // Print the ´CREATE´ line as is and capture the table name

//            if (line.contains("CREATE TABLE")) {
//                currentTable = line.split("'")[1];
//                Log.e("", "currentTable = line.split(\"'\")[1]; : " + currentTable);
//
////                sqlite.append(line).append("\n");
//            }

            // Clean table end line like:
            // ) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='By definition:\r\n- user_group #1 is administrator and will always have all permissions.\r\n- user_group #2 is guest and always have no permissions.\r\n';

            if (line.startsWith(")")) {
                sqlite.append(");\n");
                continue;
            }

            // Remove CONSTRAINT `fk_address_state1`" part from lines
            line = line.replaceAll("^CONSTRAINT[\\s][`'][\\w]+[`' ][\\s]", "");


            // Replace "XXXXX KEY" by "KEY" except "PRIMARY KEY" "FOREIGN KEY" and "UNIQUE KEY"

            //noinspection RegExpDuplicateCharacterInClass
            line = line.replaceAll("^[FOREIGN|PRIMARY|UNIQUE]+[\\s]+KEY", "KEY");

            // Replace "current_timestamp()" by "CURRENT_TIMESTAMP"
            line = line.replace("current_timestamp()", "CURRENT_TIMESTAMP");

            // Lines starting with (UNIQUE) KEY are extracted so we declare them all at the end of the script

            // We also append key name with table name to avoid duplicate index name
            // Example: KEY `name` (`permission_name`)


//            if ((m = / ^ (UNIQUE\s)*KEY\s +[`'"](\w+)[`' "]\s+\([`'"](\w +)[`'"]/ig.exec(line)) !== null) {
//
//            keyUnique = m[1] || "";
//            keyName = m[2];
//            colName = m[3];
//            keys.push('CREATE ' + keyUnique + 'INDEX `' + currentTable + '_' + keyName + '` ON `' + currentTable + '` (`' + colName + '`);');
//            continue;


            // Print all fields definition lines except "KEY" lines and lines starting with ")"

            if (!line.startsWith("^[^)]((?![\\w]+[\\s]KEY).)*$")) {

                // Clear invalid keywords

                //noinspection RegExpDuplicateAlternationBranch
                line = line.replaceAll("AUTO_INCREMENT|CHARACTER SET [^ ]+|CHARACTER SET [^ ]+|UNSIGNED", "");

//                line = line.replace(/DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP|COLLATE [^ ]+/ig, "");

                line = line.replaceAll("COMMENT\\s['\"`].*['\"`]", "");


                line = line.replaceAll("SET[^)]|ENUM[^)]", "TEXT ");

                // Clear weird MySQL types such as varchar(40) and int(11)
                line = line.replaceAll("int\\([0-9]*\\)", "INTEGER");

                line = line.replaceAll("varchar\\([0-9]*\\)|LONGTEXT", "TEXT");

            }

            sqlite.append(line);

            if (line.endsWith(";")) {
                sqlite.append("\n");
            }
            Log.e("", "Line appended: " + line);

        }
        return sqlite;
    }


    public boolean convertToSql(String line) throws IOException {

        if (!isWait)
            res = new StringBuilder();

        if (line == null || line.length() == 0) {
            return false;
        }

        line = line.trim();

        // Print the ´CREATE´ line as is and capture the table name

        if (line.contains("CREATE TABLE")) {

            Pattern pattern = Pattern.compile("^\\s*CREATE TABLE.*[`\"](.*)[`\"]");
            Matcher m = pattern.matcher(line);
            try {
                while (m.find()) {
                    currentTable = m.group(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            Log.e("", "currentTable =: " + currentTable);
//                sqlite.append(line).append("\n");
        }

        // Skip lines that match regexes in the skip[] array above
        for (String sk : skip) {
            if (line.startsWith(sk)) {
                Log.e("", "skip:" + line);
                return false;
            }
        }

        if (line.startsWith(")")) {
            if (res.length() > 1 && res.charAt(res.length() - 1) == ',') {
                Log.e("ine.startsWith(\")\")", "BUILDER: " + res);
                res.deleteCharAt(res.length() - 1);
            }
            res.append(");\n");
            isWait = false;
            return true;
        }

        // Remove CONSTRAINT `fk_address_state1`" part from lines
        if (line.contains("CONSTRAINT"))
            line = line.replaceAll("^CONSTRAINT[\\s][`'][\\w]+[`' ][\\s]", "");

        // Replace "XXXXX KEY" by "KEY" except "PRIMARY KEY" "FOREIGN KEY" and "UNIQUE KEY"
        if (line.contains("KEY")) {
            line = line.replaceAll("^((?!FOREIGN))((?!PRIMARY))((?!UNIQUE))\\\\w+\\\\s+KEY", "KEY");


            Pattern pattern = Pattern.compile("^(UNIQUE\\s)*KEY\\s+[`'\"](\\w+)[`'\"]\\s+\\([`'\"](\\w+)[`'\"]");
            Matcher m = pattern.matcher(line);

            String keyUnique = "";
            String keyName = "";
            String colName = "";

            try {
                while (m.find()) {
                    keyUnique = m.group(1);
                    keyName = m.group(2);
                    colName = m.group(3);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }


//            String[] m = line.split("^(UNIQUE\\s)*KEY\\s+[`'\"](\\w+)[`'\"]\\s+\\([`'\"](\\w+)[`'\"]");

            if (!Objects.requireNonNull(keyName).equals("") && !Objects.requireNonNull(colName).equals("")) {

                endCmd.append("CREATE ")
                        .append(keyUnique == null ? "" : keyUnique)
                        .append("INDEX `")
                        .append(currentTable).append('_').append(keyName)
                        .append("` ON `")
                        .append(currentTable)
                        .append("` (`")
                        .append(colName)
                        .append("`);\n");

                Log.e("", "\n\n INIT endCmd: " + endCmd);
                return false;
            }
        }
//        line = line.replaceAll("^[FOREIGN|UNIQUE]+[\\s]+KEY", "KEY");

        // Replace "current_timestamp()" by "CURRENT_TIMESTAMP"
        if (line.contains("current_timestamp()"))
            line = line.replace("current_timestamp()", "CURRENT_TIMESTAMP");


        // Print all fields definition lines except "KEY" lines and lines starting with ")"
        if (!line.startsWith("^[^)]((?![\\w]+[\\s]KEY).)*$")) {

            // Clear invalid keywords

            //noinspection RegExpDuplicateAlternationBranch
            line = line.replaceAll("AUTO_INCREMENT|CHARACTER SET [^ ]+|CHARACTER SET [^ ]+|UNSIGNED", "");

//                line = line.replace(/DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP|COLLATE [^ ]+/ig, "");

            line = line.replaceAll("COMMENT\\s['\"`].*['\"`]", "");


            line = line.replaceAll("SET[^)]|ENUM[^)]", "TEXT ");

            // Clear weird MySQL types such as varchar(40) and int(11)
            line = line.replaceAll("int\\([0-9]*\\)", "INTEGER");

            line = line.replaceAll("varchar\\([0-9]*\\)|LONGTEXT", "TEXT");

            res.append(line);
        }

        // Include all `INSERT` lines. Replace \' by ''
        if (res.toString().startsWith("INSERT")) {
            res = new StringBuilder(res.toString().replaceAll("\\\\'", "''"));
        }


        if (line.endsWith(";")) {
            isWait = false;
            return true;
        } else {
            isWait = true;
            return false;
        }
    }

    public StringBuilder getRes() {
        Log.e("", "--->>    COMMAND: " + res);
        return res;
    }

    public StringBuilder getEndCmd() {
        return endCmd;
    }


    // Print all fields definition lines except "KEY" lines and lines starting with ")"

//        if (/^[^)](( ? ![\w]+\sKEY).)*$ / gi.test(line)){
//            // Clear invalid keywords
//            line = line.replace( / AUTO_INCREMENT | CHARACTER SET[ ^ ]+ | CHARACTER SET[ ^ ]
//            + | UNSIGNED / ig, "");
//            line = line.replace( / DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP|COLLATE[ ^ ]
//            + / ig, "");
//            line = line.replace( / COMMENT\s['"`].*[' "`]/ig, " ");
//            line = line.replace( / SET\([ ^)]+\)|ENUM[ ^)]+\)/ig, "TEXT ");
//            // Clear weird MySQL types such as varchar(40) and int(11)
//            line = line.replace( / int\([0 - 9] *\)/ig, "INTEGER");
//            line = line.replace( / varchar\([0 - 9] *\)|LONGTEXT / ig, "TEXT");
//        }
//
//        if (line != "") {
//            sqlite += line + "\n";
//        }

//
//    sqlite +="\n";
//
//    // Fix last table line with comma
//    sqlite =sqlite.replace(/,\n\);/g,"\n);");
//
//    // Include all gathered keys as CREATE INDEX
//    sqlite +="\n\n"+keys.join("\n")+"\n\n";
//
//    // Re-enable foreign key check
//    sqlite +="COMMIT;\n"+
//            "PRAGMA ignore_check_constraints = ON;\n"+
//            "PRAGMA foreign_keys = ON;\n"+
//            "PRAGMA journal_mode = WAL;\n"+
//            "PRAGMA synchronous = NORMAL;\n";
//
//
//
//			document.getElementById('sqlite').value =sqlite;
//
//        return res;
}
