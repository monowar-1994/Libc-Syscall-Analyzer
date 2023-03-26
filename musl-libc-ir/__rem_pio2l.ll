; ModuleID = 'src/math/__rem_pio2l.c'
source_filename = "src/math/__rem_pio2l.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__rem_pio2l(x86_fp80 noundef %0, x86_fp80* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = alloca [3 x double], align 16
  %4 = alloca [2 x double], align 16
  %5 = bitcast [3 x double]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #4
  %6 = bitcast [2 x double]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6) #4
  %7 = bitcast x86_fp80 %0 to i80
  %8 = lshr i80 %7, 64
  %9 = trunc i80 %8 to i32
  %10 = and i32 %9, 32767
  %11 = shl nuw nsw i32 %10, 16
  %12 = zext i32 %11 to i64
  %13 = trunc i80 %7 to i64
  %14 = lshr i64 %13, 48
  %15 = or i64 %14, %12
  %16 = icmp ult i64 %15, 1075366159
  br i1 %16, label %17, label %87

17:                                               ; preds = %2
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 0xK3FFEA2F9836E4E44152A, x86_fp80 0xK403EC000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %18, x86_fp80 0xK403EC000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %19, metadata !"fpexcept.ignore") #5
  %21 = and i32 %20, 2147483647
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3FF921FB54444000, metadata !"fpexcept.ignore") #5
  %23 = fneg x86_fp80 %19
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %23, x86_fp80 %22, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %19, x86_fp80 0xKBFD7973DCB3B399D747F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %24, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %26, x86_fp80 0xKBFFEC90FDAA22168C235, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %27, label %28, label %31, !prof !3

28:                                               ; preds = %17
  %29 = add nsw i32 %21, -1
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %19, x86_fp80 0xKBFFF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

31:                                               ; preds = %17
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %24, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %32, x86_fp80 0xK3FFEC90FDAA22168C235, metadata !"ogt", metadata !"fpexcept.ignore") #5
  br i1 %33, label %34, label %44, !prof !3

34:                                               ; preds = %31
  %35 = add nuw nsw i32 %21, 1
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %19, x86_fp80 0xK3FFF8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

37:                                               ; preds = %28, %34
  %38 = phi x86_fp80 [ %36, %34 ], [ %30, %28 ]
  %39 = phi i32 [ %35, %34 ], [ %29, %28 ]
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3FF921FB54444000, metadata !"fpexcept.ignore") #5
  %41 = fneg x86_fp80 %38
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %41, x86_fp80 %40, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %38, x86_fp80 0xKBFD7973DCB3B399D747F, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %44

44:                                               ; preds = %37, %31
  %45 = phi x86_fp80 [ %25, %31 ], [ %43, %37 ]
  %46 = phi x86_fp80 [ %24, %31 ], [ %42, %37 ]
  %47 = phi x86_fp80 [ %19, %31 ], [ %38, %37 ]
  %48 = phi i32 [ %21, %31 ], [ %39, %37 ]
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %46, x86_fp80 %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store x86_fp80 %49, x86_fp80* %1, align 16, !tbaa !4
  %50 = bitcast x86_fp80 %49 to i80
  %51 = lshr i80 %50, 64
  %52 = trunc i80 %51 to i32
  %53 = and i32 %52, 32767
  %54 = sub nsw i32 %10, %53
  %55 = icmp sgt i32 %54, 22
  br i1 %55, label %56, label %80

56:                                               ; preds = %44
  %57 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0xBD72E7B967674000, metadata !"fpexcept.ignore") #5
  %58 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %47, x86_fp80 %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %59 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %46, x86_fp80 %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %60 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %46, x86_fp80 %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %61 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %60, x86_fp80 %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %62 = fneg x86_fp80 %61
  %63 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %47, x86_fp80 0xK3FAEC51701B839A25205, x86_fp80 %62, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %64 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %59, x86_fp80 %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store x86_fp80 %64, x86_fp80* %1, align 16, !tbaa !4
  %65 = bitcast x86_fp80 %64 to i80
  %66 = lshr i80 %65, 64
  %67 = trunc i80 %66 to i32
  %68 = and i32 %67, 32767
  %69 = sub nsw i32 %10, %68
  %70 = icmp sgt i32 %69, 61
  br i1 %70, label %71, label %80

71:                                               ; preds = %56
  %72 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3AE8A2E037074000, metadata !"fpexcept.ignore") #5
  %73 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %47, x86_fp80 %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %74 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %59, x86_fp80 %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %75 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %59, x86_fp80 %74, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %76 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %75, x86_fp80 %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %77 = fneg x86_fp80 %76
  %78 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %47, x86_fp80 0xKBF85BB5BF6C7DDD660CE, x86_fp80 %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %79 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %74, x86_fp80 %78, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store x86_fp80 %79, x86_fp80* %1, align 16, !tbaa !4
  br label %80

80:                                               ; preds = %56, %71, %44
  %81 = phi x86_fp80 [ %79, %71 ], [ %64, %56 ], [ %49, %44 ]
  %82 = phi x86_fp80 [ %78, %71 ], [ %63, %56 ], [ %45, %44 ]
  %83 = phi x86_fp80 [ %74, %71 ], [ %59, %56 ], [ %46, %44 ]
  %84 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %83, x86_fp80 %81, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %85 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %84, x86_fp80 %82, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %86 = getelementptr inbounds x86_fp80, x86_fp80* %1, i64 1
  store x86_fp80 %85, x86_fp80* %86, align 16, !tbaa !4
  br label %144

87:                                               ; preds = %2
  %88 = icmp eq i32 %10, 32767
  br i1 %88, label %89, label %92

89:                                               ; preds = %87
  %90 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %91 = getelementptr inbounds x86_fp80, x86_fp80* %1, i64 1
  store x86_fp80 %90, x86_fp80* %91, align 16, !tbaa !4
  store x86_fp80 %90, x86_fp80* %1, align 16, !tbaa !4
  br label %144

92:                                               ; preds = %87
  %93 = and i80 %7, 18446744073709551615
  %94 = or i80 %93, 302637283273278903812096
  %95 = bitcast i80 %94 to x86_fp80
  br label %96

96:                                               ; preds = %92, %96
  %97 = phi i1 [ true, %92 ], [ false, %96 ]
  %98 = phi i64 [ 0, %92 ], [ 1, %96 ]
  %99 = phi x86_fp80 [ %95, %92 ], [ %106, %96 ]
  %100 = tail call i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80 %99, metadata !"fpexcept.ignore") #5
  %101 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %100, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %102 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 %98
  store double %101, double* %102, align 8, !tbaa !8
  %103 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %101, metadata !"fpexcept.ignore") #5
  %104 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %99, x86_fp80 %103, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %105 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x4170000000000000, metadata !"fpexcept.ignore") #5
  %106 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %104, x86_fp80 %105, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br i1 %97, label %96, label %107

107:                                              ; preds = %96
  %108 = tail call double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80 %106, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %109 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 2
  store double %108, double* %109, align 16, !tbaa !8
  %110 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %111 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %108, double %110, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %111, label %112, label %119

112:                                              ; preds = %107, %112
  %113 = phi i64 [ %118, %112 ], [ 1, %107 ]
  %114 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 %113
  %115 = load double, double* %114, align 8, !tbaa !8
  %116 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %117 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %115, double %116, metadata !"oeq", metadata !"fpexcept.ignore") #5
  %118 = add i64 %113, -1
  br i1 %117, label %112, label %119

119:                                              ; preds = %112, %107
  %120 = phi i64 [ 2, %107 ], [ %113, %112 ]
  %121 = trunc i64 %120 to i32
  %122 = getelementptr inbounds [3 x double], [3 x double]* %3, i64 0, i64 0
  %123 = getelementptr inbounds [2 x double], [2 x double]* %4, i64 0, i64 0
  %124 = add nsw i32 %10, -16406
  %125 = add nsw i32 %121, 1
  %126 = call i32 @__rem_pio2_large(double* noundef nonnull %122, double* noundef nonnull %123, i32 noundef %124, i32 noundef %125, i32 noundef 2) #6
  %127 = getelementptr inbounds [2 x double], [2 x double]* %4, i64 0, i64 1
  %128 = load double, double* %127, align 8, !tbaa !8
  %129 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %128, metadata !"fpexcept.ignore") #5
  %130 = load double, double* %123, align 16, !tbaa !8
  %131 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %130, metadata !"fpexcept.ignore") #5
  %132 = call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %131, x86_fp80 %129, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %133 = call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double %130, metadata !"fpexcept.ignore") #5
  %134 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %132, x86_fp80 %133, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %135 = call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %129, x86_fp80 %134, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %136 = icmp ult i32 %9, 32768
  br i1 %136, label %142, label %137

137:                                              ; preds = %119
  %138 = fneg x86_fp80 %132
  store x86_fp80 %138, x86_fp80* %1, align 16, !tbaa !4
  %139 = fneg x86_fp80 %135
  %140 = getelementptr inbounds x86_fp80, x86_fp80* %1, i64 1
  store x86_fp80 %139, x86_fp80* %140, align 16, !tbaa !4
  %141 = sub nsw i32 0, %126
  br label %144

142:                                              ; preds = %119
  store x86_fp80 %132, x86_fp80* %1, align 16, !tbaa !4
  %143 = getelementptr inbounds x86_fp80, x86_fp80* %1, i64 1
  store x86_fp80 %135, x86_fp80* %143, align 16, !tbaa !4
  br label %144

144:                                              ; preds = %142, %137, %89, %80
  %145 = phi i32 [ %48, %80 ], [ 0, %89 ], [ %141, %137 ], [ %126, %142 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #4
  ret i32 %145
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f80(x86_fp80, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fptrunc.f64.f80(x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2_large(double* noundef, double* noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!"branch_weights", i32 1, i32 2000}
!4 = !{!5, !5, i64 0}
!5 = !{!"long double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"double", !6, i64 0}
