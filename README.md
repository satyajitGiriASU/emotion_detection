# emotion_detection
This  project  broadly  addresses  the  problem  of  feature  selection  for  the  purpose
of  facial  expression  recognition.   The  popular  methods  used  for  expression  recognition  in  the
literature are using the Gabor Energy filters, Haar like feature extractor and local binary
patterns.  This project focuses on an advanced method to perform feature extraction based on
the HVS i.e.  it uses spatiotemporal Gabor motion energy filter (GME) which will be compared
with the Gabor energy (GE) filter and Haar like feature extractor in terms of classification of
expression using selected features.  Finally, a Support Vector Machine (SVM) classifier is trained
using the features from each of these filters to draw a comparison between the cross validation
accuracy of the three filters. We observe that the GME outperforms the other two methods.
