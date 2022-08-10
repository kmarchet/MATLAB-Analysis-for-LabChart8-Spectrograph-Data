# MATLAB-Analysis-for-LabChart8-Spectrograph-Data
Code to analyze spectrograph data for LabChart8. It counts the number of each type of wave then gives you the power for each. It's helpful if you want to collect data to compare the types of waves and their powers immediately after EEG data collection. You need to have exported the spectrograph data as a spectrograph PSD, and it will give out: 

(1) Text file for all the waves and how many times they appear in the sample 
(2) A separate text file for all the powers of each wave separately
(3) A plot of each. Import the text onto Google Sheets or Excel for further analysis.  

Parameters: alpha (between 8 to 13 Hz; average amplitudes of 30 to 50 μV peak-to-peak) beta (13 to 30 Hz; &lt;20 μV peak-to-peak) theta (4 and 8 Hz; &lt;30 μV peak-to-peak) delta (0.5 and 4 Hz; up to 100 - 200 μV peak-to-peak)  gamma (30 and 50 Hz)  Table outputs, all seperate files: (1) AlphaPower (2) BetaPower (3) DeltaPower (4) GammaPower (5) ThetaPower  Again, you will have to import this into google sheets if you want to combine all of them. Export image of figures as you would normally.  (6) WaveCountsAll
