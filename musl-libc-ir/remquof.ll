; ModuleID = 'src/math/remquof.c'
source_filename = "src/math/remquof.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define float @remquof(float noundef %0, float noundef %1, i32* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = bitcast float %0 to i32
  %5 = lshr i32 %4, 23
  %6 = and i32 %5, 255
  %7 = bitcast float %1 to i32
  %8 = lshr i32 %7, 23
  %9 = and i32 %8, 255
  store i32 0, i32* %2, align 4, !tbaa !3
  %10 = and i32 %7, 2147483647
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %16, label %12

12:                                               ; preds = %3
  %13 = icmp ugt i32 %10, 2139095040
  %14 = icmp eq i32 %6, 255
  %15 = or i1 %13, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %12, %3
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %19 = tail call float @llvm.experimental.constrained.fdiv.f32(float %17, float %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %156

20:                                               ; preds = %12
  %21 = and i32 %4, 2147483647
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %156, label %23

23:                                               ; preds = %20
  %24 = icmp eq i32 %6, 0
  br i1 %24, label %25, label %38

25:                                               ; preds = %23
  %26 = shl i32 %4, 9
  %27 = icmp sgt i32 %26, -1
  br i1 %27, label %28, label %34

28:                                               ; preds = %25, %28
  %29 = phi i32 [ %32, %28 ], [ %26, %25 ]
  %30 = phi i32 [ %31, %28 ], [ 0, %25 ]
  %31 = add nsw i32 %30, -1
  %32 = shl nuw i32 %29, 1
  %33 = icmp sgt i32 %32, -1
  br i1 %33, label %28, label %34

34:                                               ; preds = %28, %25
  %35 = phi i32 [ 0, %25 ], [ %31, %28 ]
  %36 = sub i32 1, %35
  %37 = shl i32 %4, %36
  br label %41

38:                                               ; preds = %23
  %39 = and i32 %4, 8388607
  %40 = or i32 %39, 8388608
  br label %41

41:                                               ; preds = %38, %34
  %42 = phi i32 [ %6, %38 ], [ %35, %34 ]
  %43 = phi i32 [ %40, %38 ], [ %37, %34 ]
  %44 = icmp eq i32 %9, 0
  br i1 %44, label %45, label %58

45:                                               ; preds = %41
  %46 = shl i32 %7, 9
  %47 = icmp sgt i32 %46, -1
  br i1 %47, label %48, label %54

48:                                               ; preds = %45, %48
  %49 = phi i32 [ %52, %48 ], [ %46, %45 ]
  %50 = phi i32 [ %51, %48 ], [ 0, %45 ]
  %51 = add nsw i32 %50, -1
  %52 = shl nuw i32 %49, 1
  %53 = icmp sgt i32 %52, -1
  br i1 %53, label %48, label %54

54:                                               ; preds = %48, %45
  %55 = phi i32 [ 0, %45 ], [ %51, %48 ]
  %56 = sub i32 1, %55
  %57 = shl i32 %7, %56
  br label %61

58:                                               ; preds = %41
  %59 = and i32 %7, 8388607
  %60 = or i32 %59, 8388608
  br label %61

61:                                               ; preds = %58, %54
  %62 = phi i32 [ %60, %58 ], [ %57, %54 ]
  %63 = phi i32 [ %9, %58 ], [ %55, %54 ]
  %64 = icmp slt i32 %42, %63
  br i1 %64, label %67, label %65

65:                                               ; preds = %61
  %66 = icmp sgt i32 %42, %63
  br i1 %66, label %70, label %84

67:                                               ; preds = %61
  %68 = add nsw i32 %42, 1
  %69 = icmp eq i32 %68, %63
  br i1 %69, label %103, label %156

70:                                               ; preds = %65, %70
  %71 = phi i32 [ %80, %70 ], [ %43, %65 ]
  %72 = phi i32 [ %81, %70 ], [ 0, %65 ]
  %73 = phi i32 [ %82, %70 ], [ %42, %65 ]
  %74 = sub i32 %71, %62
  %75 = xor i32 %74, -1
  %76 = lshr i32 %75, 31
  %77 = or i32 %76, %72
  %78 = icmp slt i32 %74, 0
  %79 = select i1 %78, i32 %71, i32 %74
  %80 = shl i32 %79, 1
  %81 = shl i32 %77, 1
  %82 = add nsw i32 %73, -1
  %83 = icmp sgt i32 %82, %63
  br i1 %83, label %70, label %84

84:                                               ; preds = %70, %65
  %85 = phi i32 [ %42, %65 ], [ %63, %70 ]
  %86 = phi i32 [ 0, %65 ], [ %81, %70 ]
  %87 = phi i32 [ %43, %65 ], [ %80, %70 ]
  %88 = sub i32 %87, %62
  %89 = xor i32 %88, -1
  %90 = lshr i32 %89, 31
  %91 = or i32 %90, %86
  %92 = icmp slt i32 %88, 0
  %93 = select i1 %92, i32 %87, i32 %88
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %112, label %95

95:                                               ; preds = %84
  %96 = icmp ult i32 %93, 8388608
  br i1 %96, label %97, label %103

97:                                               ; preds = %95, %97
  %98 = phi i32 [ %100, %97 ], [ %93, %95 ]
  %99 = phi i32 [ %101, %97 ], [ %85, %95 ]
  %100 = shl nuw nsw i32 %98, 1
  %101 = add nsw i32 %99, -1
  %102 = icmp ult i32 %98, 4194304
  br i1 %102, label %97, label %103

103:                                              ; preds = %97, %95, %67
  %104 = phi i32 [ %42, %67 ], [ %85, %95 ], [ %101, %97 ]
  %105 = phi i32 [ 0, %67 ], [ %91, %95 ], [ %91, %97 ]
  %106 = phi i32 [ %43, %67 ], [ %93, %95 ], [ %100, %97 ]
  %107 = icmp sgt i32 %104, 0
  br i1 %107, label %108, label %112

108:                                              ; preds = %103
  %109 = add i32 %106, -8388608
  %110 = shl i32 %104, 23
  %111 = or i32 %109, %110
  br label %118

112:                                              ; preds = %84, %103
  %113 = phi i32 [ %106, %103 ], [ 0, %84 ]
  %114 = phi i32 [ %105, %103 ], [ %91, %84 ]
  %115 = phi i32 [ %104, %103 ], [ -30, %84 ]
  %116 = sub i32 1, %115
  %117 = lshr i32 %113, %116
  br label %118

118:                                              ; preds = %112, %108
  %119 = phi i32 [ %105, %108 ], [ %114, %112 ]
  %120 = phi i32 [ %104, %108 ], [ %115, %112 ]
  %121 = phi i32 [ %111, %108 ], [ %117, %112 ]
  %122 = bitcast i32 %121 to float
  %123 = fneg float %1
  %124 = icmp slt i32 %7, 0
  %125 = select i1 %124, float %123, float %1
  %126 = icmp eq i32 %120, %63
  br i1 %126, label %142, label %127

127:                                              ; preds = %118
  %128 = add nsw i32 %120, 1
  %129 = icmp eq i32 %128, %63
  br i1 %129, label %130, label %145

130:                                              ; preds = %127
  %131 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %132 = tail call float @llvm.experimental.constrained.fmul.f32(float %131, float %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %133 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %132, float %125, metadata !"ogt", metadata !"fpexcept.ignore") #2
  br i1 %133, label %142, label %134

134:                                              ; preds = %130
  %135 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %136 = tail call float @llvm.experimental.constrained.fmul.f32(float %135, float %122, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %137 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %136, float %125, metadata !"oeq", metadata !"fpexcept.ignore") #2
  %138 = xor i1 %137, true
  %139 = and i32 %119, 1
  %140 = icmp eq i32 %139, 0
  %141 = select i1 %138, i1 true, i1 %140
  br i1 %141, label %145, label %142

142:                                              ; preds = %134, %130, %118
  %143 = tail call float @llvm.experimental.constrained.fsub.f32(float %122, float %125, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %144 = add i32 %119, 1
  br label %145

145:                                              ; preds = %142, %134, %127
  %146 = phi float [ %143, %142 ], [ %122, %134 ], [ %122, %127 ]
  %147 = phi i32 [ %144, %142 ], [ %119, %134 ], [ %119, %127 ]
  %148 = and i32 %147, 2147483647
  %149 = xor i32 %7, %4
  %150 = sub nsw i32 0, %148
  %151 = icmp slt i32 %149, 0
  %152 = select i1 %151, i32 %150, i32 %148
  store i32 %152, i32* %2, align 4, !tbaa !3
  %153 = fneg float %146
  %154 = icmp slt i32 %4, 0
  %155 = select i1 %154, float %153, float %146
  br label %156

156:                                              ; preds = %67, %20, %145, %16
  %157 = phi float [ %19, %16 ], [ %155, %145 ], [ %0, %20 ], [ %0, %67 ]
  ret float %157
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
