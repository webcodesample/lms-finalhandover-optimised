<?php
$documentsSourceFolderPath = "crn_documents/1002/";

// Filter out . and ..
$documentPaths = glob($documentsSourceFolderPath."*.*");
$copyFlag = false;

if(count($documentPaths) == 0)
echo "No files available to copy";
else
{
    $destinationFolder = "testcopy";
    createDateFolder($destinationFolder);
    $destinationFolder .= "/".date('dMY');
    $subfolderCount = getSubfolderCountGlob($destinationFolder);
    $folderName = makeFolder($destinationFolder,$subfolderCount);

    foreach ($documentPaths as $documentPath)
    {
        if(copyDocs($documentPath,$folderName))
        $copyFlag = true;
    }
}

if($copyFlag)
echo "New subfolder '".explode('/',$folderName)[2]."' created successfully with ".count($documentPaths)." files in folder '".$destinationFolder."'";


//functions definition start

function makeFolder($folder,$count)
{
    $folderName = $folder."/set_".$count."/";

    if (is_dir($folderName))
    $folderName = makeFolder($folder,$count+1);
    else
    mkdir($folderName, 0777, true);
    
    return $folderName;
}

function copyDocs($documentPath,$folderName)
{
    $documentName = pathinfo($documentPath, PATHINFO_FILENAME);
    $documentExt = pathinfo($documentPath, PATHINFO_EXTENSION);
    $documentNewName = $documentName."_".strtotime('now').".".$documentExt;
    return copy($documentPath, $folderName.$documentNewName);
}

function getSubfolderCount($folder)
{
    $subfolders = scandir($folder);
    $count = 1;
    $restrictedDir = ['.','..'];

    foreach($subfolders AS $subfolder)
    {
        if(!in_array($subfolder,$restrictedDir) && is_dir($folder."/".$subfolder))
        $count++;
    }
    return $count;
}

function getSubfolderCountGlob($folder)
{
    $subfolders = glob($folder."/*");
    $count = 1;

    foreach($subfolders AS $subfolder)
    {
        if(is_dir($subfolder))
        $count++;
    }
    return $count;
}

function createDateFolder($folder)
{
    $dateFolderName = $folder."/".date('dMY')."/";
    if(!is_dir($dateFolderName))
    mkdir($dateFolderName, 0777, true);
}
?>