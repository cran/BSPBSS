% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pre_nii.R
\name{pre_nii}
\alias{pre_nii}
\title{Transforms NIfTI to matrix}
\usage{
pre_nii(nii, mask)
}
\arguments{
\item{nii}{4D NIfTI-class object with dimensions x,y,z and t. Can be read from NIfTI file with \code{readNIfTI} function from the package \code{oro.nifti}.}

\item{mask}{Mask variable, also in NIfTI format.}
}
\value{
List containing the data matrix with t rows and x*y*z colums (voxels), and the coordinates of the voxels.
}
\description{
This function transforms a NIfTI-class object into a matrix.
}
