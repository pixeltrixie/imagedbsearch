<?php

//Check whether the form has been submitted
if (array_key_exists('check_submit', $_GET)) {

	//http://www.html-form-guide.com/php-form/php-form-checkbox.html
	$orientation = $_GET['formCheckboxoption'];
	
   	//Check whether to search by Radio button 1
  	if (isset($_GET['formCheckboxoption']) && isset($_GET['radioname']) && $_GET['radioname']=='radio1value') { 
    
  		$checkbox1 = $_GET['formCheckboxoption'][0];
  		$checkbox2 = $_GET['formCheckboxoption'][1];

		if(isset($_GET['radio1high'])){
			$radio1high = $_GET['radio1high'];
		}
		if(isset($_GET['radio1low'])){
			$radio1low = $_GET['radio1low'];
		}
		if(isset($_GET['radio1ahigh'])){
			$radio1ahigh = $_GET['radio1ahigh'];
		}
		if (isset($_GET['radio1alow'])){
			$radio1alow = $_GET['radio1alow'];
		}

		$file = "searchall.xsl";
	}
	
	//Check whether to search by Radio button 2
	else if (isset($_GET['formCheckboxoption']) && isset($_GET['radioname']) && $_GET['radioname']=='radio2value') { 
    
  		$checkbox1 = $_GET['formCheckboxoption'][0];
  		$checkbox2 = $_GET['formCheckboxoption'][1];
		
		$datehigh = $_GET['to'] . "23:" . "59:" . "59";
		$datelow = $_GET['from'];
	
		$radio2high = strtotime($datehigh);
		$radio2low = strtotime($datelow);

		$file = "searchall.xsl";
	}
 
 	//If no refined search parameters, search Checkbox parameter only
 	else if (isset($_GET['formCheckboxoption'])) { 
    
  		$checkbox1 = $_GET['formCheckboxoption'][0];
  		$checkbox2 = $_GET['formCheckboxoption'][1];
 
 		$file = "searchcheckbox.xsl";
 	}
 }
 
// Transform xml using xsl template

$xp = new XsltProcessor();
$xp->registerPHPFunctions();
$xsl = new DomDocument;
$xsl->load($file);
$xp->importStylesheet($xsl);

$xml_doc = new DomDocument;
$xml_doc->load('gallery.xml');

$xp->setParameter(NULL, 'checkbox1' , $checkbox1); 
$xp->setParameter(NULL, 'checkbox2' , $checkbox2); 
$xp->setParameter(NULL, 'radio1high' , $radio1high); 
$xp->setParameter(NULL, 'radio1low' , $radio1low); 
$xp->setParameter(NULL, 'radio1ahigh' , $radio1ahigh); 
$xp->setParameter(NULL, 'radio1alow' , $radio1alow); 
$xp->setParameter(NULL, 'radio2high' , $radio2high); 
$xp->setParameter(NULL, 'radio2low' , $radio2low); 

//$xslt->importPHPFunctions();

if ($html = $xp->transformToXML($xml_doc)) {
    echo $html;
  } else {
      trigger_error('XSL transformation failed.', E_USER_ERROR);
  }

?>