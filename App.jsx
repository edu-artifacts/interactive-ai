import React, { useState } from 'react';
import { ArrowLeft } from 'lucide-react';
import CNNCourseHub from './cnn-course-hub';
import CNNFlowViz from './cnn-overview';
import PixelsAndImages from './level-1-pixels';
import MatrixMath from './level-2-matrix-math';
import BasicNeuralNetwork from './level-3-basic-nn';
import ConvolutionDeepDive from './level-4-convolution';
import KernelGallery from './level-5-kernel-gallery';
import FeatureMaps from './level-6-feature-maps';
import Pooling from './level-7-pooling';
import ClassificationHead from './level-8-classification';
import Training from './level-9-training';
import DeeperNetworks from './level-10-deeper-networks';
import FamousArchitectures from './level-11-architectures';
import Interpretability from './level-12-interpretability';

const App = () => {
  const [currentView, setCurrentView] = useState('hub');

  const navigateTo = (view) => {
    setCurrentView(view);
    window.scrollTo(0, 0);
  };

  const BackButton = () => (
    <button
      onClick={() => navigateTo('hub')}
      className="fixed top-4 left-4 z-50 px-4 py-2 bg-slate-800/90 backdrop-blur border border-slate-700 rounded-lg text-white hover:bg-slate-700 transition-all flex items-center gap-2 shadow-lg"
    >
      <ArrowLeft size={18} />
      <span>Back to Course</span>
    </button>
  );

  const renderView = () => {
    switch (currentView) {
      case 'overview':
        return (
          <>
            <BackButton />
            <CNNFlowViz />
          </>
        );
      case 'level1':
        return (
          <>
            <BackButton />
            <PixelsAndImages />
          </>
        );
      case 'level2':
        return (
          <>
            <BackButton />
            <MatrixMath />
          </>
        );
      case 'level3':
        return (
          <>
            <BackButton />
            <BasicNeuralNetwork />
          </>
        );
      case 'level4':
        return (
          <>
            <BackButton />
            <ConvolutionDeepDive />
          </>
        );
      case 'level5':
        return (
          <>
            <BackButton />
            <KernelGallery />
          </>
        );
      case 'level6':
        return (
          <>
            <BackButton />
            <FeatureMaps />
          </>
        );
      case 'level7':
        return (
          <>
            <BackButton />
            <Pooling />
          </>
        );
      case 'level8':
        return (
          <>
            <BackButton />
            <ClassificationHead />
          </>
        );
      case 'level9':
        return (
          <>
            <BackButton />
            <Training />
          </>
        );
      case 'level10':
        return (
          <>
            <BackButton />
            <DeeperNetworks />
          </>
        );
      case 'level11':
        return (
          <>
            <BackButton />
            <FamousArchitectures />
          </>
        );
      case 'level12':
        return (
          <>
            <BackButton />
            <Interpretability />
          </>
        );
      case 'hub':
      default:
        return <CNNCourseHub onNavigate={navigateTo} />;
    }
  };

  return renderView();
};

export default App;
