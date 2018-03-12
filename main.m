addpath NIFTI_20080201/

fid = fopen('aal/ROI_MNI_V4.txt','r'); 
aal_label = textscan(fid,'%s %s %d \n',116);
fclose(fid);

aal_label_number = aal_label{3};

nii = load_nii('aal/ROI_MNI_V4');
aal_mask = nii.img;

nii = load_nii('fsl_brain_data/MNI152_T1_2mm_brain.nii');
fsl_brain_data = nii.img;

for count = 1:116
    mask = data==aal_label{3}(count);
    data_mask = fsl_brain_data .* int16(mask);
    nii.img = data_mask;
    filename = aal_label{2}(count);filename = ['newly_created_nii/',filename{1},'.nii'];
    save_nii(nii, filename);
end

    