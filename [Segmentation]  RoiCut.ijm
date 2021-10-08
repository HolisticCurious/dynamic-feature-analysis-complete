setBatchMode(true);
input = "path\\to\\folder\\with\\8-bit\\image";
output = "path\\to\\output\\folder";
list = getFileList(input);
print(list.length);

for (i = 0; i < 1; i++){
        print(input + list[i]);
        open(input +'\\'+ list[i]);
        mainTitle=getTitle();
        print(mainTitle);
        dirCropOutput=output+File.separator;
        File.makeDirectory(dirCropOutput);     
        run("Duplicate...", " ");

        selectWindow(mainTitle);
        print(roiManager("count"));

        for (u=0; u<roiManager("count"); ++u) {
        	print(u);
            run("Duplicate...", "title=crop");
            roiManager("Select", u);
            run("Crop");
            run("Clear Outside");
            saveAs("Tiff", dirCropOutput+"The_Particle_"+(u+1)+".tif");
            //close();
            //Next round!
             selectWindow(mainTitle);
        }
        close();
}