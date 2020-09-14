package ${YYAndroidPackageName};

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import android.R;
import android.app.Activity;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Handler;
import android.text.Html;
import android.util.Log;
import android.view.View;
import android.webkit.MimeTypeMap;

@SuppressWarnings("deprecation")
public class GMShare extends RunnerSocial {

	public static final int REQUEST_CODE = 1210;
	
	public static int sdk = 0;
	public static Activity activity = null;
	public static View rootView = null;
	public static Handler viewHandler = null;
	public static String gmshare_dialogTitle;
	public static Intent gmshare_intent = null;
	public static String gmshare_extText = "";
	public static String gmshare_extSubject = "";
	public static ArrayList<Uri> gmshare_extFiles = null;
	public static String gmshare_extType = "";
	public static boolean gmshare_extHasDocuments = false;
	public static ArrayList<String> gmshare_extRecipients = null;
	public static String gmshare_extPackageNameStartsWith = "";
	public static boolean gmshare_extIsSMS = false;
	public static boolean gmshare_extIsEmail = false;
	public static boolean gmshare_extBodyIsHTML = false;
	public static boolean gmshare_didFinish = false;

	public void share_init() {
		//Log.i("yoyo", "share_init");
		sdk = android.os.Build.VERSION.SDK_INT;
		activity = RunnerActivity.CurrentActivity;
		rootView = activity.findViewById(android.R.id.content);
		viewHandler = RunnerActivity.ViewHandler;
		gmshare_dialogTitle = "Share using";
		gmshare_extFiles = new ArrayList<Uri>();
		gmshare_extRecipients = new ArrayList<String>();
	}
	
	public void share_text(String text) {
		//Log.i("yoyo", "share_text");
		share_text_ext(text, "", "");
	}

	public void share_text_ext(String text, String subject, String email) {
		//Log.i("yoyo", "share_text_ext");
		gmshare_intent = new Intent(android.content.Intent.ACTION_SEND);
		gmshare_intent.setType("text/plain");
	    if (subject != "") {
	    	gmshare_intent.putExtra(android.content.Intent.EXTRA_SUBJECT, subject);
	    }
	    if (email != "") {
	    	gmshare_intent.putExtra(android.content.Intent.EXTRA_EMAIL, email);
	    }
	    gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, text);
	    activity.startActivityForResult(android.content.Intent.createChooser(gmshare_intent, gmshare_dialogTitle), REQUEST_CODE);
	}
	
	public void share_url(String url) {
		//Log.i("yoyo", "share_url");
		share_text(url);
	}

	public void share_image(String filename) {
		//Log.i("yoyo", "share_image");
		share_file(filename);
	}
	
	public void share_file(String filename) {
		//Log.i("yoyo", "share_file");
		shareFile(filename, getMimeType(filename));
	}

	public void share_set_popover_origin(double x, double y) {
		//Log.i("yoyo", "share_set_popover_origin");
	}
	
	public void share_set_popover_region(double x, double y, double width, double height) {
		//Log.i("yoyo", "share_set_popover_region");
	}
	
	public void share_set_dialog_title(String title) {
		//Log.i("yoyo", "share_set_dialog_title");
		gmshare_dialogTitle = title;
	}

	public double share_did_finish() {
		//Log.i("yoyo", "share_did_finish");
		if (gmshare_didFinish) {
			gmshare_didFinish = false;
			return 1;
		}
		return 0;
	}
	
	public double share_get_completed() {
		//Log.i("yoyo", "share_get_completed");
		return 0;
	}
	
	public double share_get_chosen_activity() {
		//Log.i("yoyo", "share_get_chosen_activity");
		return -1;
	}
	
	public String share_get_chosen_activity_string() {
		//Log.i("yoyo", "share_get_chosen_activity_string");
		return "";
	}
	
	public void share_ext_prepare() {
		//Log.i("yoyo", "share_ext_prepare");
		gmshare_extText = "";
		gmshare_extSubject = "";
		gmshare_extFiles.clear();
		gmshare_extType = "";
		gmshare_extHasDocuments = false;
		gmshare_extRecipients.clear();
		gmshare_extPackageNameStartsWith = "";
		gmshare_extIsSMS = false;
		gmshare_extIsEmail = false;
		gmshare_extBodyIsHTML = false;
	}
	
	public void share_ext_add_text(String text) {
		//Log.i("yoyo", "share_ext_add_text");
		if (gmshare_extText.length() == 0) {
			gmshare_extText = text;
		}
		else {
			gmshare_extText = gmshare_extText + " " + text;
		}
	}
	
	public void share_ext_add_url(String url) {
		//Log.i("yoyo", "share_ext_add_url");
		share_ext_add_text(url);
	}
	
	public void share_ext_add_image(String filename) {
		//Log.i("yoyo", "share_ext_add_image");
		if (gmshare_extFiles.size() == 0) {
			gmshare_extType = getMimeType(filename);
		}
		else if (!gmshare_extHasDocuments) {
			gmshare_extType = "image/*";
		}
		else {
			gmshare_extType = "*/*";
		}
		gmshare_extFiles.add(getFileUri(filename));
	}
	
	public void share_ext_add_file(String filename) {
		//Log.i("yoyo", "share_ext_add_file");
		if (gmshare_extFiles.size() == 0) {
			gmshare_extType = getMimeType(filename);
		}
		else {
			gmshare_extType = "*/*";
		}
		gmshare_extFiles.add(getFileUri(filename));
		gmshare_extHasDocuments = true;
	}
	
	public void share_ext_set_activity(double activityType) {
		//Log.i("yoyo", "share_ext_set_activity");
		gmshare_extPackageNameStartsWith = "";
		gmshare_extIsSMS = false;
		gmshare_extIsEmail = false;
		switch ((int)activityType) {
			case 0:
				gmshare_extPackageNameStartsWith = "com.facebook.katana";
				break;
			case 1:
				gmshare_extPackageNameStartsWith = "com.twitter.android";
				break;
			case 3:
				gmshare_extIsSMS = true;
				break;
			case 4:
				gmshare_extIsEmail = true;
				break;
			default:
				break;
		}
	}
	
	public void share_ext_exclude_activity(double activityType) {
		//Log.i("yoyo", "share_ext_exclude_activity");
	}
	
	public void share_ext_set_subject(String subject) {
		//Log.i("yoyo", "share_ext_set_subject");
		gmshare_extSubject = subject;
	}
	
	public void share_ext_add_recipient(String email) {
		//Log.i("yoyo", "share_ext_add_recipient");
		gmshare_extRecipients.add(email);
	}
	
	public void share_ext_set_body_is_html(double isHTML) {
		//Log.i("yoyo", "share_ext_set_body_is_html");
		gmshare_extBodyIsHTML = false;
		if (isHTML == 1) {
			gmshare_extBodyIsHTML = true;
		}
	}
	
	public double share_ext_launch() {
		//Log.i("yoyo", "share_ext_launch");
		gmshare_intent = new Intent(android.content.Intent.ACTION_SEND);
		gmshare_intent.setType("text/plain");
		if (gmshare_extIsEmail) {
			gmshare_intent.setType("message/rfc822");
		}
		if (gmshare_extIsSMS) {
			gmshare_intent.setAction(android.content.Intent.ACTION_VIEW);
			gmshare_intent.setType("vnd.android-dir/mms-sms");
			gmshare_intent.putExtra("sms_body", gmshare_extText);
		}
		else if (gmshare_extBodyIsHTML) {
			gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, Html.fromHtml(gmshare_extText));
		}
		else {
			gmshare_intent.putExtra(android.content.Intent.EXTRA_TEXT, gmshare_extText);
		}
		if (gmshare_extSubject.length() > 0) {
			gmshare_intent.putExtra(android.content.Intent.EXTRA_SUBJECT, gmshare_extSubject);
		}
		if (gmshare_extRecipients.size() > 0) {
			String [] emailAddresses = gmshare_extRecipients.toArray(new String[gmshare_extRecipients.size()]);
			gmshare_intent.putExtra(android.content.Intent.EXTRA_EMAIL, emailAddresses);
		}
		if (gmshare_extFiles.size() > 0) {
			if (!gmshare_extIsSMS && !gmshare_extIsEmail) {
				gmshare_intent.setType(gmshare_extType);
			}
			if (gmshare_extFiles.size() == 1) {
				gmshare_intent.putExtra(android.content.Intent.EXTRA_STREAM, gmshare_extFiles.get(0));
			}
			else {
				gmshare_intent.setAction(android.content.Intent.ACTION_SEND_MULTIPLE);
				gmshare_intent.putParcelableArrayListExtra(android.content.Intent.EXTRA_STREAM, gmshare_extFiles);
			}
		}
		if (gmshare_extPackageNameStartsWith != "") {
			List<ResolveInfo> matches = activity.getPackageManager().queryIntentActivities(gmshare_intent, 0);
			for (ResolveInfo info : matches) {
			    if (info.activityInfo.packageName.toLowerCase().startsWith(gmshare_extPackageNameStartsWith)) {
					gmshare_intent.setPackage(info.activityInfo.packageName);
					activity.startActivityForResult(gmshare_intent, REQUEST_CODE);
			        return 1;
			    }
			}
			return 0;
		}
		activity.startActivityForResult(android.content.Intent.createChooser(gmshare_intent, gmshare_dialogTitle), REQUEST_CODE);
		return 1;
	}
	
	public void shareFile(String filename, String type) {
		gmshare_intent = new Intent(android.content.Intent.ACTION_SEND);
		gmshare_intent.setType(type);
		gmshare_intent.putExtra(android.content.Intent.EXTRA_STREAM, getFileUri(filename));
	    activity.startActivityForResult(android.content.Intent.createChooser(gmshare_intent, gmshare_dialogTitle), REQUEST_CODE);
	}
	
	public Uri getFileUri(String filename) {
		String path = activity.getFilesDir().getAbsolutePath() + "/" + filename;
	    File file = new File(path);
	    file.setReadable(true, false);
		return Uri.parse("file:///" + path);
	}
	
	public String getMimeType(String filename) {
	    MimeTypeMap mime = MimeTypeMap.getSingleton();
	    String extension = filename.substring(filename.lastIndexOf('.') + 1).toLowerCase();
	    String type = mime.getMimeTypeFromExtension(extension);
	    if (type != null && type != "") {
	    	return type;
	    }
	    return "*/*";
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		if (requestCode == REQUEST_CODE) {
			gmshare_didFinish = true;
		}
	}
	
}