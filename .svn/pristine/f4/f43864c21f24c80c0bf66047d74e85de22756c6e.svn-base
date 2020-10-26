package com.srm.repg.constants;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * DateUtil class
 * 
 *
 */
public class DateUtil {

	public static final String DATE_DDMMYYHHMMSS = "yyyy-MM-dd";

	public static final String DATE_YYYY_MM_DD = "yyyy-MM-dd";

	public static final String DATE_HH_MM_SS = "HH:mm:ss";

	public static final String DATE_YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	public static final String DATE_YYYY_MM_DD_HH_MI_SS = "yyyy/MM/dd HH:mm:ss";

	public static final String DATE_DD_MM_YYYY_hh_mm_aa = "dd/MM/yyyy,hh:mmaa";

	public static final String DATE_YYYYMMDDHHMISS = "yyyyMMddHHmmss";

	public static final String DATE_DDMMYYHHMISS = "ddMMyyHHmmss";

	public static final String DATE_YYYY_MM_DD_FORMAT = "yyyy/MM/dd";

	public static final String DATE_YYYY_MM_DD_JP_FORMAT = "yyyy年MM月dd日";

	public static final String DATE_YYYY_MM_DD_HH_FORMAT = "yyyy/MM/dd HH";

	public static final String DATE_YYYYMMDD = "yyyyMMdd";

	private static final int MILLISECOND = 1;

	private static final int SECOND = 1000 * MILLISECOND;

	private static final int MINUTE = 60 * SECOND;

	private static final int HOUR = 60 * MINUTE;

	private static final int DAY = 24 * HOUR;

	/**
	 * Method used to get the current date and time in the format of string.
	 * 
	 * @return String
	 */
	public static String getCurrentDateTimeAsString() {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat(DATE_YYYY_MM_DD_HH_MI_SS);
		return df.format(calendar.getTime());
	}

	/**
	 * Method used to get the current date.
	 * 
	 * @param format
	 *            String
	 * @return String
	 */
	public static String getCurrentDate(String format) {
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(calendar.getTime());
	}

	/**
	 * Method used to get the time from date.
	 * 
	 * @param date
	 *            String
	 * @return String
	 * @throws ParseException
	 */
	public static String getTimeFromDate(String date) throws ParseException {
		Date d = new SimpleDateFormat(DATE_YYYY_MM_DD_HH_MM_SS).parse(date);
		String newString = new SimpleDateFormat(DATE_HH_MM_SS).format(d);
		return newString;
	}

	/**
	 * Method used to add minutes to the time.
	 * 
	 * @param time
	 *            String
	 * @param minutes
	 *            int
	 * @return String
	 * @throws ParseException
	 */
	public static String addMinsToTime(String time, int minutes) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(DATE_HH_MM_SS);
		Date d = df.parse(time);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(d);
		calendar.add(Calendar.MINUTE, minutes);
		return df.format(calendar.getTime());
	}

	/**
	 * Method used to get the current date.
	 * 
	 * @return Date
	 */
	public static Date getCurrentDate() {
		Calendar calendar = Calendar.getInstance();
		return calendar.getTime();
	}

	/**
	 * Method used to clone the date.
	 * 
	 * @param date
	 *            Date
	 * @return Date
	 */
	public static Date clone(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTime();
	}

	/**
	 * Method used to get current day of the year.
	 * 
	 * @return int
	 */
	public static int getCurrentYear() {
		return Calendar.getInstance().get(Calendar.YEAR);
	}

	/**
	 * Method used to get current day of the month.
	 * 
	 * @return int
	 */
	public static int getCurrentMonth() {
		return Calendar.getInstance().get(Calendar.MONTH);
	}

	/**
	 * Method used to change the string to date format.
	 * 
	 * @param date
	 *            String
	 * @param format
	 *            String
	 * @return Date
	 */
	public static Date stringToDate(String date, String format) {
		try {
			return new SimpleDateFormat(format).parse(date);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * Method used to change the date to string format.
	 * 
	 * @param date
	 *            Date
	 * @param format
	 *            String
	 * @return String
	 */
	public static String dateToString(Date date, String format) {
		if (date == null)
			return null;
		String strDate = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(format);
			strDate = dateFormat.format(date);
			return strDate;
		} catch (Exception e) {
			e.printStackTrace();
			return strDate;
		}
	}

	public static void main(String[] args) {
		System.out.println(dateToString(new Date(), "yyyy年MM月dd日"));
	}

	/**
	 * Method used to change the date format.
	 * 
	 * @param date
	 *            Date
	 * @param format
	 *            String
	 * @return String
	 */
	public static String changeDateFormat(Date date, String format) {
		String conDate = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(format);
			conDate = dateFormat.format(date);
			return conDate;
		} catch (Exception e) {
			e.printStackTrace();
			return conDate;
		}
	}

	/**
	 * Method used to get add date.
	 * 
	 * @param date
	 *            String
	 * @param format
	 *            String
	 * @param days
	 *            int
	 * @return Date
	 */
	public static Date addDate(String date, String format, int days) {
		return addDate(stringToDate(date, format), days);
	}

	/**
	 * Method used to get add date.
	 * 
	 * @param date
	 *            Date
	 * @param days
	 *            int
	 * @return Date
	 */
	public static Date addDate(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		return cal.getTime();
	}

	/**
	 * Method used to get days in the month.
	 * 
	 * @param year
	 *            int
	 * @param month
	 *            int
	 * @return int
	 */
	public static int getDaysInMonth(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month);
		return cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	}

	/**
	 * Method used to get add month.
	 * 
	 * @param date
	 *            Date
	 * @param months
	 *            int
	 * @return Date
	 */
	public static Date addMonth(Date date, int months) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		return cal.getTime();
	}

	/**
	 * Method used to get add days.
	 * 
	 * @param date
	 *            Date
	 * @param days
	 *            int
	 * @return Date
	 */
	public static Date addDays(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, days);
		return cal.getTime();
	}

	/**
	 * Method used to get add hour.
	 * 
	 * @param dateStr
	 *            String
	 * @param format
	 *            String
	 * @param hour
	 *            int
	 * @return Date
	 */
	public static Date addHour(String dateStr, String format, int hour) {
		Date date = stringToDate(dateStr, format);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, hour);
		return cal.getTime();
	}

	/**
	 * Method used to get add hour.
	 * 
	 * @param date
	 *            Date
	 * @param hour
	 *            int
	 * @return Date
	 */
	public static Date addHour(Date date, int hour) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.HOUR, hour);
		return cal.getTime();
	}

	/**
	 * Method used to get add minutes.
	 * 
	 * @param date
	 *            Date
	 * @param minutes
	 *            int
	 * @return Date
	 */
	public static Date addMinutes(Date date, int minutes) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MINUTE, minutes);
		return cal.getTime();
	}

	/**
	 * Method used to get add minutes.
	 * 
	 * @param date
	 *            Date
	 * @param minutes
	 *            int
	 * @return Date
	 */
	public static int getMinutes(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int minutes = cal.get(Calendar.MINUTE);
		return minutes;
	}

	/**
	 * Method used to get add seconds.
	 * 
	 * @param date
	 *            Date
	 * @param seconds
	 *            int
	 * @return Date
	 */
	public static Date addSeconds(Date date, int seconds) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.SECOND, seconds);
		return cal.getTime();
	}

	/**
	 * Method used to get the yesterday.
	 * 
	 * @return Date
	 */
	public static Date getYesterday() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}

	/**
	 * Method used to get the day of the month from given date.
	 * 
	 * @param date
	 *            Date
	 * @return int
	 */
	public static int getDayOFMonthFromDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * Method used to get the month from given date.
	 * 
	 * @param date
	 *            Date
	 * @return int
	 */
	public static int getMonthFromDate(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.MONTH);
	}

	/**
	 * Method used to get the yesterday year.
	 * 
	 * @param date
	 *            Date
	 * @return int
	 */
	public static int getYesterdayYear(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal.get(Calendar.YEAR);
	}

	/**
	 * Method used to check the between firstDate and secondDate are same or
	 * not.
	 * 
	 * @param firstDate
	 *            Date
	 * @param secondDate
	 *            Date
	 * @return boolean
	 */
	public static boolean isSameDate(Date firstDate, Date secondDate) {
		if (firstDate != null && secondDate != null) {
			Calendar firstCal = Calendar.getInstance();
			firstCal.setTime(firstDate);
			Calendar secondCal = Calendar.getInstance();
			secondCal.setTime(secondDate);
			if (firstCal.get(Calendar.YEAR) == secondCal.get(Calendar.YEAR)
					&& firstCal.get(Calendar.MONTH) == secondCal.get(Calendar.MONTH)
					&& firstCal.get(Calendar.DAY_OF_MONTH) == secondCal.get(Calendar.DAY_OF_MONTH)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Method used to check the date is between this startDate and endDate or
	 * not.
	 * 
	 * @param startDate
	 *            Date
	 * @param endDate
	 *            Date
	 * @param compareDate
	 *            Date
	 * @return boolean
	 */
	public static boolean isBetweenTwoDate(Date startDate, Date endDate, Date compareDate) {
		startDate = getDayStart(startDate);
		endDate = getDayEnd(endDate);
		if (compareDate.compareTo(startDate) >= 0 && endDate.compareTo(compareDate) >= 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * Method used to check the actDate and effDate after effective date or not.
	 * 
	 * @param actDate
	 *            Date
	 * @param effDate
	 *            Date
	 * @return boolean
	 */
	public static boolean isAfterEffDate(Date actDate, Date effDate) {

		if (actDate != null && effDate != null) {

			Calendar actCal = Calendar.getInstance();
			actCal.setTime(actDate);

			Calendar effCal = Calendar.getInstance();
			effCal.setTime(effDate);

			if (!isSameDate(actDate, effDate) && actDate.after(effDate)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Method used to check the actDate and effDate after effective date or not.
	 * 
	 * @param actDate
	 *            Date
	 * @param effDate
	 *            Date
	 * @return boolean
	 */
	public static boolean isAfterCurrentTime(Date date) {
		if (date != null) {
			if (date.after(getCurrentDate())) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Method used to check the firstDate and secondDate same or not.
	 * 
	 * @param firstDate
	 *            Date
	 * @param secondDate
	 *            Date
	 * @return boolean
	 */
	public static boolean isSameMonth(Date firstDate, Date secondDate) {
		if (firstDate != null && secondDate != null) {
			Calendar firstCal = Calendar.getInstance();
			firstCal.setTime(firstDate);
			Calendar secondCal = Calendar.getInstance();
			secondCal.setTime(secondDate);
			if (firstCal.get(Calendar.YEAR) == secondCal.get(Calendar.YEAR)
					&& firstCal.get(Calendar.MONTH) == secondCal.get(Calendar.MONTH)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Method used to get end of day.
	 * 
	 * @param date
	 *            Date
	 * @return Date
	 */
	public static Date getDayStart(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}

	/**
	 * Method used to get end of day.
	 * 
	 * @param date
	 *            Date
	 * @return Date
	 */
	public static Date getDayEnd(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}

	/**
	 * Method used to get hour difference between maxDate and minDate.
	 * 
	 * @param maxDate
	 *            Date
	 * @param minDate
	 *            Date
	 * @return int
	 */
	public static int getHourDifference(Date maxDate, Date minDate) {
		long milliSecond = maxDate.getTime() - minDate.getTime();
		int hour = (int) (milliSecond / HOUR);
		if (milliSecond % HOUR != 0) {
			hour = hour + 1;
		}
		return hour;
	}

	/**
	 * Method used to get days difference between maxDate and minDate.
	 * 
	 * @param maxDate
	 *            Date
	 * @param minDate
	 *            Date
	 * @return int
	 */
	public static int getDaysDifference(Date maxDate, Date minDate) {
		long milliSecond = maxDate.getTime() - minDate.getTime();
		int days = (int) (milliSecond / DAY);
		if (milliSecond % DAY != 0) {
			days = days + 1;
		}
		return days;
	}

	/**
	 * Method used to get the date.
	 * 
	 * @param year
	 *            int
	 * @param month
	 *            int
	 * @param date
	 *            int
	 * @return Date
	 */
	public static Date getDate(int year, int month, int date) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month);
		cal.set(Calendar.DAY_OF_MONTH, date);
		return cal.getTime();
	}

	/**
	 * Method used to get the year.
	 * 
	 * @param date
	 *            Date
	 * @return Date
	 */
	public static int getYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	/**
	 * Method used to get the month.
	 * 
	 * @param date
	 *            Date
	 * @return int
	 */
	public static int getMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH);
	}

	/**
	 * Method used to get the last date of month.
	 * 
	 * @param date
	 *            Date
	 * @return Date
	 */
	public static Date getLastDateOfMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	/**
	 * Method used to get Minutes difference between maxDate and minDate.
	 * 
	 * @param maxDate
	 *            Date
	 * @param minDate
	 *            Date
	 * @return int
	 */
	public static int getMinutesDifference(Date maxDate, Date minDate) {
		long milliSecond = maxDate.getTime() - minDate.getTime();
		int minute = (int) (milliSecond / MINUTE);
		if (milliSecond % MINUTE != 0) {
			minute = minute + 1;
		}
		return minute;
	}

	public static Date formatDate(Date date) throws ParseException {
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat(DATE_YYYY_MM_DD);
		String enteredDate = DATE_FORMAT.format(date);

		Date formattedDate = null;

		formattedDate = DATE_FORMAT.parse(enteredDate);

		return formattedDate;
	}

	/**
	 * Method is used to get the dates between two dates.
	 * 
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public static List<Date> getDatesBetween(Date startDate, Date endDate) {
		List<Date> datesInRange = new ArrayList<>();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(startDate);

		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(endDate);

		while (calendar.before(endCalendar)) {
			Date result = calendar.getTime();
			datesInRange.add(result);
			calendar.add(Calendar.DATE, 1);
		}
		datesInRange.add(endDate);
		return datesInRange;
	}

	public static String changeDateFormat(String time) throws ParseException {
		DateFormat df = new SimpleDateFormat("hh:mm a");

		DateFormat outputformat = new SimpleDateFormat("HH:mm");

		String output = null;

		Date date = df.parse(time);

		output = outputformat.format(date);

		return output;
	}

	public static String changeFullDateFormat(LocalDateTime fromDate) throws ParseException {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

		DateFormat outputformat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");

		String output = null;

		Date dateParse = df.parse(fromDate.toString());

		output = outputformat.format(dateParse);

		return output;
	}
	
	public static Date changeDateFormatDate(Date date) throws ParseException {
		
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			String formatedDate = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE) + " " + cal.get(Calendar.HOUR)+ ":" + cal.get(Calendar.MINUTE) + ":" +cal.get(Calendar.SECOND) ; 

			Date convertDate =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatedDate);
			return convertDate;
		
	}
	
	public static Date changeDateFormatToDate(String fromDate) throws ParseException {
		//DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		//DateFormat intputformat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
		
		Date dateConvert =new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(fromDate);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(dateConvert);
		String formatedDate = cal.get(Calendar.YEAR) + "-" + (cal.get(Calendar.MONTH) + 1) + "-" + cal.get(Calendar.DATE) + " " + cal.get(Calendar.HOUR)+ ":" + cal.get(Calendar.MINUTE) + ":" +cal.get(Calendar.SECOND) ; 

		Date convertDate =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(formatedDate);
		
		return convertDate;
		
	}

	public static LocalDateTime addDateTime(Date date, String time) throws ParseException {
		LocalDateTime dt = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dateString = dateFormat.format(date);

			LocalDate datePart = LocalDate.parse(dateString);
			String timeChange = changeDateFormat(time);
			LocalTime timePart = LocalTime.parse(timeChange);
			dt = LocalDateTime.of(datePart, timePart);

		} catch (Exception e) {
			e.getMessage();
		}
		return dt;
	}

	/**
	 * To get the difference between two time
	 * 
	 * @param fromTime
	 * @param toTime
	 * @return
	 * @throws ParseException
	 */
	public static int timeDifference(String fromTime, String toTime) throws ParseException {

		DateFormat df = new SimpleDateFormat("hh:mm a");
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		
		Date timeFromFirst = df.parse(fromTime);
		Date timeToFirst = df.parse(toTime);
		
		String timeFrom = format.format(timeFromFirst);
		String timeTo = format.format(timeToFirst);
		
		Date timeFromDate = format.parse(timeFrom);
		Date timeToDate = format.parse(timeTo);
		
		long difference = timeToDate.getTime() - timeFromDate.getTime();
		
		int minute = (int) (difference / 1000);
		int min = (int) minute / 60;

		return min;

	}
	
	public static String getchangeDateFormat(String date , String formatChange , String formatCurrent) throws ParseException {
		Date d = new SimpleDateFormat(formatCurrent).parse(date);
		String newString = new SimpleDateFormat(formatChange).format(d);
		return newString;
	}
}
