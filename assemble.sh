for file in *
do
cat nex_topper.txt $file capper_f > ./mk-f/$file
cat nex_topper.txt $file capper_pi > ./mk-pi/$file
cat nex_topper.txt $file capper_v > ./mk-v/$file
cat nex_topper.txt $file capper_p > ./mk-p/$file
done
