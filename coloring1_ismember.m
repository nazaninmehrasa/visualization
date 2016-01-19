%function coloring1( frame_numbers, superPixels)
    %frame_numbers=[1 21];
    %superPixels=[1 1;321 12];
    load('vw_commercial_vidinfo.mat')
    load('/cs/vml2/nmehrasa/eccv16/code/similarities.mat')
    load('allsegsvw_commercial.mat')


    count=0;
    for frame = 1:21
        idx=find(frame_numbers==frame);
        if(~isempty(idx))
           % figure;
            img=ones(360,640);
            img=255.*img;
            img = (cat(3,img,img,img));
            sp_temp=superPixels(:,idx);
            is_mem=ismember(labelledlevelvideo(:,:,frame),sp_temp);
            is_mem=(cat(3,is_mem,is_mem,is_mem));
            img=img.*is_mem;
            %imshow(img);
            imwrite(img,['./coloring/',num2str(frame),'.jpg']);
        end
    end
%end
