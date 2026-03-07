#!/bin/bash

LOGFILE=$1
DATE=$(date +%Y-%m-%d)
REPORT=log_report_$DATE.txt
ERROR_COUNT=0
TOTAL_LINES=$(wc -l < "$LOGFILE")

input_validation()
{
        if [ -z $LOGFILE ]; then
                echo "Usage: $0 <logfile_path>"
                exit 1
        fi

        if [ ! -f $LOGFILE ]; then
                echo "Logfile doesn't exist!"
                exit 1
        fi
}

error_count()
{
        echo ""
        echo "Total number of lines containing the keyword ERROR or Failed: "
        ERROR_COUNT=$(grep -Ei "ERROR|Failed" $LOGFILE | wc -l)
        echo $ERROR_COUNT
}

critical_events()
{
        echo ""
        echo "--- Critical Events ---"
        grep -n "CRITICAL" $LOGFILE
}

top_error_messages()
{
        echo ""
        echo "--- Top 5 Error Messages ---"
        grep "ERROR" $LOGFILE | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5
}

summary_report()
{
        {
                echo "Log Analysis Report"
                echo "==============================="
                echo "Date of Analysis: $DATE"
                echo "Log File: $LOGFILE"
                echo "Total Lines Processed: $TOTAL_LINES"
                echo "Total Error Count: $ERROR_COUNT"
                echo ""

                echo "--- Top 5 Error Messages ---"
                grep "ERROR" "$LOGFILE" \
                | awk '{$1=$2=$3=""; print}' \
                | sort \
                | uniq -c \
                | sort -rn \
                | head -5

                echo ""

                echo "--- Critical Events ---"
                grep -n "CRITICAL" "$LOGFILE" || echo "No critical events found."
        } > $REPORT
        echo ""
        echo "Log report generated: $REPORT"
}

archive_processed_logs()
{
        ARCHIVE="archive"
        mkdir -p $ARCHIVE
        mv $LOGFILE $ARCHIVE
        echo ""
        echo "Logfile moved to archive/"
}

main()
{
        input_validation
        echo "Analyzing log file: $LOGFILE"
        error_count
        critical_events
        top_error_messages
        summary_report
        archive_processed_logs
}
main
