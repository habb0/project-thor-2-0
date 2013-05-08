<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<?
// Par défaut : anglais
$directoryListing = "Folders in server root (\"www\")";
$noDir = "no folder";
$presentation = "This page display folders in server root. You can delete this page if you want to organize differently the folder. There'e a backup oh this file in &quot;safe&quot; directory (index-safe.php).";

$browser_languages = explode(",", getenv("HTTP_ACCEPT_LANGUAGE"));
$nb_browser_languages = sizeof($browser_languages);
$browser_lang = "";	// ne pas initialiser
$biContinue = true;

for ($niI = 0; $biContinue==true && $niI < $nb_browser_languages; $niI++)
{
	$biContinue = false;
	$lg = explode("-", $browser_languages[$niI]);
	switch ($lg[0])
	{
	case "fr" : $directoryListing = "R&eacute;pertoire(s) &agrave; la racine du serveur (\"www\")";
				$noDir = "aucun répertoire";
				$presentation = "Cette page permet de visualiser les r&eacute;pertoires plac&eacute;s &agrave; la racine du serveur. Si vous souhaitez organiser autrement le r&eacute;pertoire &quot;www&quot;, vous pouvez effacer ce fichier. Il en existe une copie de sauvegarde dans le r&eacute;pertoire &quot;safe&quot; (index-safe.php).";
				break;
	case "en" : break;
	default: $biContinue = true;
	}
}
				
?>
<html>
<head>
<title>[EasyPHP] - Web Local</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
.text1 {font-family: Arial, Helvetica, sans-serif;font-size: 12px;color: White;text-align : left;}
.text2 {font-family: Arial, Helvetica, sans-serif;font-size: 12px;color: Silver;text-align : left;}
.titre1 {font-family: Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;color: #FFFFFF;}
.titre2 {font-family: Arial, Helvetica, sans-serif;font-size: 12px;font-weight: bold;color: #cccccc;}
</style>
</head>

<body bgcolor="#525A73">
 
<div align="center">
<table width="400" cellspacing="0" cellpadding="0" border="0" align="center">
<tr>
<td>
<a href="index.php"><img src="images_easyphp/titre_easyphp_weblocal.gif" width="387" height="116" border="0"></a>
</td>
</tr>
<tr>
</table>
</div>

<table width="500" border="0" cellspacing="4" cellpadding="0" align="center">
<tr> 
<td><img src="images_easyphp/cube_rouge_small.gif" width="18" height="20"></td>
<td width="100%" nowrap class="titre1">&nbsp;<? echo $directoryListing; ?>&nbsp;:</td>
</tr>
</table>

<table width="500" border="0" cellspacing="2" cellpadding="0" align="center">
<?
$rep=opendir('.');
$bAuMoinsUnRepertoire = false;
while ($file = readdir($rep)){
	if($file != '..' && $file !='.' && $file !=''){ 
		if (is_dir($file)){
			$bAuMoinsUnRepertoire = true;
			print("<tr><td nowrap class='text1'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>");
			print("<td width='100%' class='text1'>");
			print("&nbsp;&nbsp;<img src='images_easyphp/dossier.gif' width='23' height='16' align='absbottom'>&nbsp;");
			print("<a href='$file/' class='text1'>$file</a>");
			print("</td></tr>");
		}
	}
}
if ($bAuMoinsUnRepertoire == false) {
	print("<tr><td nowrap class='text1'><div align='center'>-&nbsp; $noDir &nbsp;-</div></td>");
	print("</td></tr>");
}

closedir($rep);
clearstatcache();
?>
</table>

<br>

<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td class="text1">
<? echo $presentation ?> 
</td>
</tr>
</table>
</body>
</html>
