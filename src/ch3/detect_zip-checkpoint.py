{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import cv2\n",
    "import matplotlib.pyplot as plt\n",
    "\n",
    "\n",
    "def detect_zipno(fname):\n",
    "    img = cv2.imread(fname)\n",
    "    h, w = img.shape[:2]\n",
    "    img = img[0:h//2, w//3:]\n",
    "    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)\n",
    "    gray = cv2.GaussianBlur(gray, (3, 3), 0) \n",
    "    im2 = cv2.threshold(gray, 140, 255, cv2.THRESH_BINARY_INV)[1]\n",
    "    cnts, _ = cv2.findContours(im2, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)\n",
    "    result = []\n",
    "    for pt in cnts:\n",
    "        x, y, w, h = cv2.boundingRect(pt)\n",
    "        if not(50 < w < 70): continue\n",
    "        result.append([x, y, w, h])\n",
    "    result = sorted(result, key=lambda x: x[0])\n",
    "    result2 = []\n",
    "    lastx = -100\n",
    "    for x, y, w, h in result:\n",
    "        if (x - lastx) < 10: continue\n",
    "        result2.append([x, y, w, h])\n",
    "        lastx = x\n",
    "    for x, y, w, h in result2:\n",
    "        cv2.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 3)\n",
    "    return result2, img"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
